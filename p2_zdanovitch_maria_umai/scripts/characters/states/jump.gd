extends State

func enter():
	sprite.play("anim_" + name)
	print("jump")
	
	player.velocity.y = -player.jump_force

func physics_update(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x = direction * player.speed
	
	if player.velocity.y <= 0:
		player.velocity.y += player.gravity * _delta
	
	if player.velocity.y > 0:
		get_parent().change_state("Falling")
	
	player.move_and_slide()

func exit():
	sprite.stop()
