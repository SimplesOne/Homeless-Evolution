extends Area2D

@export var message: String = "Press E"
@onready var ui_label = $"../../CanvasLayer/RichTextLabel"
@onready var ui_label2 = $"../../CanvasLayer/RichTextLabel2"
@onready var Gangster = $"../../Gangster"
@onready var Gangster_sprite = Gangster.get_node("AnimatedSprite2D")

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
		ui_label2.visible = false
		player_ref.position = Vector2(126, 734)
		Gangster_sprite.flip_h = true
		Gangster.visible = true
		ui_label.text = "Boss: Pleaca de aici boschetare si intoarce-te mai tarziu"
		await wait(3)
		ui_label.text = "Eu: Inregula, prietene"
		
		monitoring = false

func wait(duration):  
	await get_tree().create_timer(duration, false, false, true).timeout
#func _on_area_exited(area: Area2D) -> void:
#	if area.name == "Player":
#		player_inside = false
#		ui_label.visible = false
