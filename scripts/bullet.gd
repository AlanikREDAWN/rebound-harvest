extends Node2D

@export var speed: int = 550

@onready var enemy_death_noise: AudioStreamPlayer = $EnemyDeathNoise
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

const ENEMY_RECOIL = 40.0

var direction: Vector2
var first: bool = true

var zdex: int

func _physics_process(delta: float) -> void:
	direction = Vector2.RIGHT.rotated(rotation)
	global_position += direction * speed * delta
	if first:
		Global.bullet_direction.emit(Vector2.RIGHT.rotated(rotation))
		first = false

func destroy():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#print("bye bye")
	destroy()

func _ready() -> void:
	z_index = -20

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		var enemy_health = body.find_children("*", "Health")[0]
		if enemy_health.get_health() == 0:  
			body.get_parent().queue_free()
			collision_shape_2d.disabled = true
			enemy_death_noise.play()
			await enemy_death_noise.finished
		else:
			enemy_health.set_health(enemy_health.get_health() - 1)
			body.get_parent().global_position += ENEMY_RECOIL * direction
		destroy()
		
