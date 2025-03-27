extends State

func enter():
	sprite.play("anim_" + name)
	print("attack")

func physics_update(_delta):
	await sprite.animation_finished
	get_parent().change_state("Idle")
	

func exit():
	sprite.stop()
