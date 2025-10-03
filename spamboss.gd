extends CanvasLayer

@onready var label = $Label

var progress := 0.0
var max_progress := 100.0
var increase_per_press := 5.0
var decrease_speed := 20.0

func _ready():
	label.text = "Press Q"

func _process(delta):
	# Increase when pressing Q
	if Input.is_key_pressed(KEY_Q):
		progress = min(progress + increase_per_press, max_progress)

	# Decrease naturally over time
	else:
		progress = max(progress - decrease_speed * delta, 0)

	# Debug output
	label.text = "Press Q | Progress: " + str(progress)
