extends Node2D

@onready var gun: Node2D = $"."
const bullet = preload("res://scenes/bullet.tscn")

func shoot():
	print(bullet)
	var bullet_instance = bullet.instantiate()
	#bullet_instance.dir = rotation
	bullet_instance.spawnPos = global_position
	bullet_instance.spawnRot = rotation
	gun.add_child.call_deferred(bullet_instance)

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("shoot"):
		#shoot()

func _input(event):
	if event is InputEventMouseButton:
		shoot()
		#print("shoot")
