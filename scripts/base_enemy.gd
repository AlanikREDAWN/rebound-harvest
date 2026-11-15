extends Node2D

@onready var enemy_body_2d: CharacterBody2D = $CharacterBody2D

const enemyDataDict = {
	"spider" = {
		"speed":80.0,
		"detectionRange":300.0
	},
	"angel" = {
		"speed":50.0,
		"detectionRange":400.0
	}
}

const ANGEL_TELEPORT_COOLDOWN = 5.0

var target = null
var ENEMY_TYPE = ""
var DETECT_RADIUS = 300.0
var ENEMY_SPEED = 80.0
#@onready var player: Node2D = $"."
#@onready var character_body_2d: CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ENEMY_TYPE = get_meta("type") # Replace with function body.
	var ENEMY_DATA = enemyDataDict[ENEMY_TYPE]
	ENEMY_SPEED = ENEMY_DATA["speed"]
	DETECT_RADIUS = ENEMY_DATA["detectionRange"]
	
	if ENEMY_TYPE == "angel":
		teleport()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	updateTarget(delta)
	# Check to prevent enemy code running after death
	
func updateTarget(delta) -> void:
	if (Global.player_position - global_position).length() < DETECT_RADIUS:
		target = Player
		global_position += delta * ENEMY_SPEED * (Global.player_position - global_position).normalized()
	else:
		target = null

func teleport() -> void:
	while enemy_body_2d:
		if target:
			var radius = (Global.player_position - global_position).length()
			
			var randomAngle = randi_range(1,360)
			var randRadAngle = deg_to_rad(randomAngle)
			
			global_position = Global.player_position + (radius * Vector2(cos(randRadAngle), sin(randRadAngle)))
			
		await get_tree().create_timer(ANGEL_TELEPORT_COOLDOWN).timeout

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
