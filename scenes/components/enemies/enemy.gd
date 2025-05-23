extends CharacterBody2D
class_name Enemy

@export var hp : int

func take_damage(damage : int):
	hp -= damage
	
	if hp <= 0:
		die()
	
	blink()
	#Globals.blink(self)

func blink():
	self.modulate.a = 0
	await get_tree().create_timer(0.1).timeout
	self.modulate.a = 100
	await get_tree().create_timer(0.1).timeout

func die():
	queue_free()
