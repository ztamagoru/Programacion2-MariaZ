extends State

@export var attack_hitbox : Area2D

func enter():
	sprite.play("anim_" + name)
	print("attack")

func physics_update(_delta):
	for hit in attack_hitbox.get_overlapping_bodies():
		if hit.is_in_group("enemies"):
			hit.queue_free()
	
	await sprite.animation_finished
	get_parent().change_state("Idle")
	

func exit():
	sprite.stop()
