extends Node2D

@export var speed: int = 200
var direction: Vector2

var zdex: int

func _physics_process(delta: float) -> void:
	direction = Vector2.RIGHT.rotated(rotation)
	global_position += direction * speed * delta

func destroy():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("bye bye")
	destroy()

func _ready() -> void:
	z_index = -20


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		
		var enemy_health = body.find_children("*", "Health")[0]
		if enemy_health.get_health() == 0:
			body.queue_free()
		else:
			enemy_health.set_health(enemy_health.get_health() - 1)
		print(enemy_health.get_health())
		destroy()
		
