extends Area2D

@export var message: String = "Press E"
@onready var ui_label = $"../../CanvasLayer/RichTextLabel"
@onready var Shaman = $"../../Shaman"
@onready var Shaman_sprite = Shaman.get_node("AnimatedSprite2D")

var player_inside = false
var player_ref = null

func _ready():
	ui_label.visible = false

func _on_area_entered(body):
	if body.name == "Player":
		player_inside = true
		player_ref = body
		ui_label.text = message
		ui_label.visible = true

func _process(delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		ui_label.text = "Shaman: Salut calatorule, am o cafea pregatita pentru tine"
		await wait(3)
		ui_label.text = "Pare dubios dar mi-ar prinde bine"
		await wait(3)
		_trigger_ui_animation()
		wait(0.3)
		get_tree().change_scene_to_file("res://Mystical.tscn")
		monitoring = false

func _trigger_ui_animation():
	var anim_scene = preload("res://blink.tscn")
	var anim_instance = anim_scene.instantiate()
	get_tree().current_scene.add_child(anim_instance)

func wait(duration):  
	await get_tree().create_timer(duration, false, false, true).timeout
#func _on_area_exited(area: Area2D) -> void:
#	if area.name == "Player":
#		player_inside = false
#		ui_label.visible = false
