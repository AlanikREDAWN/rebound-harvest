extends CharacterBody2D
@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	Global.disableBrother.connect(_disable_brother)
	
func _disable_brother():
	area_2d.monitoring = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.brotherEntered.emit()
