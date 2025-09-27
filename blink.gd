extends CanvasLayer

@onready var rect1 = $Top
@onready var rect2 = $Bottom

func _ready():
	move_rects()

func move_rects():
	var tween = create_tween()
	
	# Animate rect1 down
	tween.tween_property(rect1, "position", rect1.position + Vector2(0, 600), 0.3)
	
	# Animate rect2 down at the same time
	tween.parallel().tween_property(rect2, "position", rect2.position - Vector2(0, 600), 0.3)
	
	# Animate both back up after
	tween.tween_property(rect1, "position", rect1.position, 0.3)
	tween.parallel().tween_property(rect2, "position", rect2.position, 0.3)
