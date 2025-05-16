extends State

@export var attack_hitbox : Area2D

func enter():
	sprite.play("anim_" + name)
	print("attack")
	for enemy in attack_hitbox.get_overlapping_bodies():
		if enemy.is_in_group("enemies"):
			enemy.take_damage(10)

func physics_update(_delta):
	await sprite.animation_finished
	get_parent().change_state("Idle")
	

func exit():
	sprite.stop()
