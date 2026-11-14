extends Node2D

@onready var player: Node2D = $"../.."


@onready var heart_1: Sprite2D = $heart1
@onready var heart_2: Sprite2D = $heart2
@onready var heart_3: Sprite2D = $heart3

@onready var health: Health = player.find_children("*", "Health")[0]


func _ready() -> void:
	health.health_changed.connect(_update_hearts)

func _update_hearts():
	if health.get_health() == 3:
		heart_1.visible = true
		heart_2.visible = true
		heart_3.visible = true
	elif health.get_health() == 2:
		heart_1.visible = false
	elif health.get_health() == 1:
		heart_1.visible = false
		heart_2.visible = false
	elif health.get_health() == 0:
		heart_1.visible = false
		heart_2.visible = false
		heart_3.visible = false

func _process(delta: float) -> void:
	pass
