extends Node2D

@onready var enemy_body_2d: CharacterBody2D = $CharacterBody2D

const DETECT_RADIUS = 300.0
const ENEMY_SPEED = 80.0

var target = null
#@onready var player: Node2D = $"."
#@onready var character_body_2d: CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_meta("speed")) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	updateTarget(delta)
	# Check to prevent enemy code running after death
	
func updateTarget(delta) -> void:
	if (Global.player_position - global_position).length() < DETECT_RADIUS:
		global_position += delta * ENEMY_SPEED * (Global.player_position - global_position).normalized()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#print("DETECTED")
		var player_health = body.find_children("*", "Health")[0]
		if player_health.get_health() == 0:
			pass
		else:
			player_health.set_health(player_health.get_health() - 1)
		print(player_health.get_health())
		
		
	#var future_pos = target.position + target.velocity * prediction_factor
	#velocity = -((position - future_pos).normalized() * speed)
	#return

func _death():
#	
	#get_tree().change_scene_to_file()
	pass
