extends Node2D

const REF_SPIDER: PackedScene = preload("res://scenes/base_enemy.tscn")
const REF_ANGEL: PackedScene = preload("res://scenes/angel.tscn")

const monsterListDict = {
	
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while self:
		pass		
		await get_tree().create_timer(ANGEL_TELEPORT_COOLDOWN).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
