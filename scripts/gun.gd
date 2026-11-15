extends Node2D

@onready var gun: Node2D = $"."
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var cooldown_timer: Timer = $CooldownTimer
@onready var gun_fire: AnimatedSprite2D = $CharacterBody2D/GunFire

const MAX_BULLETS = 6
const REF_BULLET: PackedScene = preload("res://scenes/bullet.tscn")

var cooldown = false

func _ready() -> void:
	Global.max_bullets = 6
	Global.gun_refreshed.connect(refresh_bullets)
	
func refresh_bullets():
	set_meta("bullet_count", Global.max_bullets)

func shoot_bullet():
	if cooldown:
		return
		
	var bulletCount = get_meta("bullet_count")
	if bulletCount == 0:
		return
	else:
		set_meta("bullet_count", bulletCount-1)
		Global.gun_fired.emit(get_meta("bullet_count"))
		
	var bullet = REF_BULLET.instantiate()
	audio_stream_player_2d.play()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = self.global_position
	
	gun_fire.play("fire")
	
	var bullet_rotation = self.global_position.direction_to(get_global_mouse_position()).angle()
	bullet.rotation = bullet_rotation
	
	cooldown = true
	cooldown_timer.start()
	
func _on_timer_timeout():
	cooldown = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot_bullet()
