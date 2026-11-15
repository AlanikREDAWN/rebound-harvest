class_name EnemySpawner

extends Node2D

@export var id : String

const REF_SPIDER: PackedScene = preload("res://scenes/base_enemy.tscn")
const REF_ANGEL: PackedScene = preload("res://scenes/angel.tscn")

const monsterListDict = {
	"1":[[REF_SPIDER, 0.9], [REF_ANGEL, 0.1]]
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while self:
		pass
		await get_tree().create_timer(1.0).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
