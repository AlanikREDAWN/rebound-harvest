extends Node2D

@export var SPEED = 100

var target_direction
var spawnPos: Vector2
var spawnRot: float

func _ready() -> void:
	#global_position = spawnPos
	#global_rotation = spawnRot
	target_direction = (get_global_mouse_position() - global_position).normalized()


func _physics_process(delta: float) -> void:
	#velocity = Vector2(0, -SPEED).rotated(dir)
	#move_and_slide()
	global_position += target_direction * SPEED * delta
