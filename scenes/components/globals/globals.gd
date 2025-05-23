extends Node

var player : CharacterBody2D
var save_manager : Node

func blink(object):
	for i in range(3):
		#print("taking damage")
		object.modulate.a = 0
		await get_tree().create_timer(0.1).timeout
		object.modulate.a = 100
		await get_tree().create_timer(0.1).timeout
