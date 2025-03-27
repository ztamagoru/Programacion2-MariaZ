extends State

func enter():
	sprite.play("anim_" + name)
	print("running")

func physics_update(_delta):
	if not player.is_on_floor():
		get_parent().change_state("Falling")
	
	if Input.is_action_just_pressed("attack"):
			get_parent().change_state("Attack")
	
	if Input.is_action_just_pressed("jump"):
			get_parent().change_state("Jump")
	
	var direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x = direction * player.speed
	player.move_and_slide()
	
	if player.velocity.x == 0:
		get_parent().change_state("Idle")

func exit():
	sprite.stop()
