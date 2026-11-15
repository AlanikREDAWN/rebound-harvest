extends Node2D

@onready var gun: Node2D = $"."
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var cooldown_timer: Timer = $CooldownTimer

const REF_BULLET: PackedScene = preload("res://scenes/bullet.tscn")

var cooldown = false

func shoot_bullet():
	if cooldown:
		return
		
	var bullet = REF_BULLET.instantiate()
	audio_stream_player_2d.play()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = self.global_position

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
