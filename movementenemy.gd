extends Area2D

@export var max_health := 100
var current_health := max_health

func take_damage(amount: int) -> void:
	current_health -= amount
	print("Enemy took ", amount, " damage! Current HP: ", current_health)

	if current_health <= 0:
		die()

func die():
	print("Enemy died.")
	queue_free()  # Removes the enemy from the scene
