extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.gun_fired.connect(gun_fired)
	Global.gun_refreshed.connect(gun_refreshed) # Replace with function body.

func gun_fired(currentBullets) -> void:
	self.text = "x" + str(currentBullets)
	
func gun_refreshed() -> void:
	self.text = "x" + str(Global.max_bullets)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
