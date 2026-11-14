extends Node2D

@onready var gun: Node2D = $"."
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

const REF_BULLET: PackedScene = preload("res://scenes/bullet.tscn")

func shoot_bullet():
	var bullet = REF_BULLET.instantiate()
	audio_stream_player_2d.play()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = self.global_position

	var bullet_rotation = self.global_position.direction_to(get_global_mouse_position()).angle()
	bullet.rotation = bullet_rotation

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot_bullet()
