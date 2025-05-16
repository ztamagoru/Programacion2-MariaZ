extends CharacterBody2D
class_name Enemy

@export var hp : int

func take_damage(damage : int):
	hp -= damage
	
	if hp <= 0:
		die()

func die():
	queue_free()
