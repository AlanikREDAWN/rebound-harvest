extends Node2D

const DETECT_RADIUS = 100.0

var target = null
@onready var player = $"../player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check to prevent enemy code running after death
	updateTarget()
	
func updateTarget() -> void:
	print(Player.position)


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
