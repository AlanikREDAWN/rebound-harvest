extends Node2D

@onready var player: Node2D = $"."

@onready var gun: Node2D = $Gun
@onready var gun_sprite_2d: AnimatedSprite2D = $CharacterBody2D/AnimatedSprite2D
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var health: Health = player.find_children("*", "Health")[0]

const gunPlayerRadius = 30.0
const ROT_INCREMENT = 50
const GUN_OFFSET_VECTOR = Vector2(0,-10)

var dir = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(health.get_health())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateGunState()
	
func updateGunState() -> void:
	var viewX = get_viewport().get_window().size.x
	var viewY = get_viewport().get_window().size.y
	dir = (get_viewport().get_mouse_position() - Vector2(viewX/2,viewY/2)).normalized()
	var dirToAngle = dir.angle()
	
	var playerOffset = character_body_2d.position
	
	gun.position = playerOffset + Vector2(gunPlayerRadius*cos(dirToAngle),gunPlayerRadius*sin(dirToAngle)) + GUN_OFFSET_VECTOR
	gun.rotation = dirToAngle
	
