extends State

func enter():
	sprite.play("anim_" + name)
	print("jump")
	
	player.jump_count += 1
	player.velocity.y = -player.jump_force

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x = direction * player.speed * delta
	
	if player.velocity.y <= 0:
		player.velocity.y += player.gravity * delta
	
	if player.velocity.y > 0:
		get_parent().change_state("Falling")
	
	if Input.is_action_just_pressed("jump") and player.double_jump and player.jump_count < 2:
		get_parent().change_state("Jump")
	
	player.move_and_slide()

func exit():
	sprite.stop()
