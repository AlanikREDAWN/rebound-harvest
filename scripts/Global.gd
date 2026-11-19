extends Node

enum Cutscenes {SPAWN, BROTHER, ROCK, SEWER}
var cutscene = Cutscenes.SPAWN

var sewerTextInt: int = 1
var sewerText = false
var sewerTextCompleted = false

var sewerAnimPlay = false

var rockTextInt: int = 1
var rockText = false
var rockTextCompleted =  false

var spawnTextInt: int = 1
var spawnText = true
var spawnTextCompleted = false

var talkedToBrother = false
var brotherTextInt: int = 1
var brotherText = false

signal brotherEntered
signal disableBrother

var player_position
var max_bullets
var in_sewer = false

signal bullet_direction(direction)
signal playerHit()
signal gun_fired()
signal gun_refreshed()

var player_health
var death = false
func _ready() -> void:
	await get_tree().process_frame
	if Player.instance:
		player_health = Player.instance.find_children("*", "Health")[0]

func _process(delta: float) -> void:
	if death == false:
		await get_tree().process_frame
		if Player.instance:
			player_health = Player.instance.find_children("*", "Health")[0]
			if player_health.get_health() == 0:
				death = true
				var death_timer: Timer = Timer.new()
				add_child(death_timer)
				death_timer.wait_time = 1.5
				death_timer.one_shot = true
				death_timer.timeout.connect(_death)
				death_timer.start()

func _death():
	#Player.queue_free()
	get_tree().change_scene_to_file("res://scenes/UI/death.tscn")
	Player.instance.queue_free()
