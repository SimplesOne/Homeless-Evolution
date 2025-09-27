extends Area2D

@onready var ui_label = $"../../CanvasLayer/RichTextLabel"  # reference to your UI element
var player_inside = false

func _ready():
	ui_label.visible = false  # hide text at start

func _on_area_entered(body):
	if body.name == "Player":  # check if it's the player
		player_inside = true
		ui_label.text = "Press E"
		ui_label.visible = true

func _process(delta):
	if player_inside and Input.is_action_just_pressed("interact"):  # "ui_accept" = Enter/Space/E
		print("Player pressed input inside zone")
		ui_label.text = "you died"
		# You can run whatever action you want here


func _on_area_exited(area: Area2D) -> void:
	if area.name == "Player":
		player_inside = false
		ui_label.visible = false
