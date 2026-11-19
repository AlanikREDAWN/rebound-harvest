class_name Player
extends CharacterBody2D

static var instance: Player

@onready var char_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 120.0
const RECOIL_MAGNITUDE = 800.0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if not Global.in_sewer:
		#print("player can move")
		var direction := Input.get_vector("left", "right", "up", "down")
		if direction:
			if direction.x > 0:
				char_sprite_2d.flip_h = false
			else:
				char_sprite_2d.flip_h = true
			
			if (velocity.length() <= SPEED):
				velocity = SPEED * Vector2(direction.x, direction.y).normalized()
			else:
				velocity.x = move_toward(velocity.x, SPEED * Vector2(direction.x, direction.y).normalized().x, SPEED)
				velocity.y = move_toward(velocity.y, SPEED * Vector2(direction.x, direction.y).normalized().y, SPEED)
			
			char_sprite_2d.play("walk")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
			
			char_sprite_2d.play("default")
	else:
		
		var direction := Input.get_axis("left", "right")
		if direction:
			if direction > 0:
				char_sprite_2d.flip_h = false
			else:
				char_sprite_2d.flip_h = true
			
			if (velocity.length() <= SPEED):
				velocity.x = SPEED * direction
			else:
				velocity.x = move_toward(velocity.x, SPEED * direction, SPEED)
			
			char_sprite_2d.play("walk")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
			char_sprite_2d.play("default")

	move_and_slide()

@onready var player: Node2D = $"."

#@onready var gun: Node2D = $CharacterBody2D/Gun
@onready var gun: Node2D = $Gun
@onready var gun_sprite_2d: AnimatedSprite2D = $Gun/CharacterBody2D/AnimatedSprite2D
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var health: Health = player.find_children("*", "Health")[0]

const gunPlayerRadius = 30.0
const ROT_INCREMENT = 50
const GUN_OFFSET_VECTOR = Vector2(0,-10)

var dir = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("player is spawned")
	print(health.get_health())
	Global.bullet_direction.connect(_recoil)
	Global.player_position = global_position

func _recoil(direction):
	velocity -= RECOIL_MAGNITUDE * direction
	
func _hit():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateGunState()
	Global.player_position = global_position
	
func updateGunState() -> void:
	var viewX = get_window().content_scale_size.x
	var viewY = get_window().content_scale_size.y
	#var viewX = get_viewport().get_window().size.x
	#var viewY = get_viewport().get_window().size.y
	dir = (get_viewport().get_mouse_position() - Vector2(viewX/2,viewY/2)).normalized()
	var dirToAngle = dir.angle()
	
	var playerOffset = player.position
	
	var degDirAngle = rad_to_deg(dirToAngle)
	
	if gun_sprite_2d:
		if degDirAngle > -90.0 and degDirAngle < 90.0:
			gun_sprite_2d.flip_v = false
		else:
			gun_sprite_2d.flip_v = true
	
	gun.position = Vector2(gunPlayerRadius*cos(dirToAngle),gunPlayerRadius*sin(dirToAngle)) + GUN_OFFSET_VECTOR
	gun.rotation = dirToAngle
