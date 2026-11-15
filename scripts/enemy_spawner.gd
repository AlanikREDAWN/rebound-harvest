class_name EnemySpawner

extends Node2D

@export var id : String
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

const REF_SPIDER: PackedScene = preload("res://scenes/base_enemy.tscn")
const REF_ANGEL: PackedScene = preload("res://scenes/angel.tscn")
const REF_SPRING: PackedScene = preload("res://scenes/spring.tscn")
const REF_RANCOR: PackedScene = preload("res://scenes/rancor.tscn")

const ENEMY_NO_GO_ZONE = 75.0

const monsterListDict = {
	"1":[2, 5, [REF_SPIDER, 0.9], [REF_ANGEL, 0.1]],
	"2":[1.5, 7, [REF_SPIDER, 0.8], [REF_ANGEL, 0.2]],
	"3":[3, 10, [REF_SPIDER, 0.5], [REF_ANGEL, 0.5]],
	"4":[1, 14, [REF_SPIDER, 0.95], [REF_ANGEL, 0.05]],
	"5":[2, 7, [REF_SPIDER, 0.4], [REF_ANGEL, 0.6]],
	#Sewer Spawners
	"6":[2, 7, [REF_SPIDER, 0.4], [REF_ANGEL, 0.2], [REF_SPRING, 0.4]],
	"7":[1.5, 10, [REF_SPIDER, 0.1], [REF_ANGEL, 0.4], [REF_SPRING, 0.4], [REF_RANCOR, 0.1]],
	"8":[3, 7, [REF_ANGEL, 0.2], [REF_SPRING, 0.5], [REF_RANCOR, 0.3]]
}

var onScreen = false
var enemyCount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var WAIT_TIME = monsterListDict[id][0]
	enemyCount = monsterListDict[id][1]
	
	while self and enemyCount > 0:
		spawn_enemy()
		await get_tree().create_timer(WAIT_TIME).timeout

func _entered_screen() -> void:
	onScreen = true

func _exited_screen() -> void:
	onScreen = false
	
func spawn_enemy() -> void:
	var playerPos = Vector2(0,0)
	
	if Global.player_position:
		playerPos = Global.player_position
	
	if (playerPos - collision_shape_2d.global_position).length() < ENEMY_NO_GO_ZONE:
		return
		
	if not onScreen:
		return
	
	var spawn_area = collision_shape_2d.shape.get_rect().size
	var randomPosition = collision_shape_2d.global_position + Vector2(spawn_area.x * randf(), spawn_area.y * randf())
	
	var enemyType
	
	var totalChance = 1.0
	
	for i in range(len(monsterListDict[id]) - 2):
		var enemyPacket = monsterListDict[id][i+2]
		var enemyChance = enemyPacket[1]
		
		if randf() >= totalChance-enemyChance:
			enemyType = enemyPacket[0]
		else:
			totalChance -= enemyChance
	
	var enem = enemyType.instantiate()
	get_tree().current_scene.add_child(enem)
	enem.global_position = randomPosition
	
	enemyCount -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
