extends Node2D

var player_instance = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = player_instance.instantiate()
	get_tree().root.add_child(player)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
