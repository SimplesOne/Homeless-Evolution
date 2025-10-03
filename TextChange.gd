extends CanvasLayer

@onready var label = $RichTextLabel
@onready var sotie = $"../Sotie"

func wait(duration):  
	await get_tree().create_timer(duration, false, false, true).timeout

func _ready():
	label.text = "Shaman: Muhahaha, ce vei face acum?"
	await wait(3)
	sotie.visible = true
	label.text = "Shaman: Iti salvezi sotia?"
	await wait(2)
	label.text = "Shaman: Sau pe tine insati?"
	await wait(2)
	label.text = "Q pentru tine - E pentru sotie"
	
func _process(delta):
	if Input.is_action_pressed("Q"):
		label.text = "Te-ai salvat pe tine, esti fericit?"
		get_tree().change_scene_to_file("res://End.tscn")
	if Input.is_action_pressed("interact"):
		get_tree().change_scene_to_file("res://End.tscn")
