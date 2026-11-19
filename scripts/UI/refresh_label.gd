extends Label

const GUN_REFRESH_TIME = 8.0

var currentTime = GUN_REFRESH_TIME

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_reset_timer() # Replace with function body.
	
func start_reset_timer():
	while self:
		if currentTime == 0:
			currentTime = GUN_REFRESH_TIME
			
			Global.gun_refreshed.emit()
			
		currentTime -= 1.0
		self.text = "Reload in... " + str(currentTime) 
		await get_tree().create_timer(1.0).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
