extends State

func enter():
	sprite.play("anim_" + name)
	print("idle")

func update(_delta):
	pass

func physics_update(delta):
	if player.is_on_floor():
		if Input.is_action_just_pressed("attack"):
			get_parent().change_state("Attack")
		
		if Input.is_action_just_pressed("jump"):
			get_parent().change_state("Jump")
		
		var direction = Input.get_axis("move_left", "move_right")
		player.velocity.x = direction * player.speed * delta
	
	if player.velocity != Vector2.ZERO:
		if player.velocity.x != 0:
			player.move_and_slide()
			get_parent().change_state("Running")
	
	if not player.is_on_floor():
		get_parent().change_state("Falling")

func exit():
	sprite.stop()
