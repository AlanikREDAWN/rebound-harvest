extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while self:
		self.play()
		await self.finished # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
