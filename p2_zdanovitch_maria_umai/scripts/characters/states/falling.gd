extends State

func enter():
	sprite.play("anim_" + name)
	print("falling")

func update(_delta):
	pass

func physics_update(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x = direction * player.speed
	player.velocity.y += player.gravity * _delta
	
	player.move_and_slide()
	
	if player.is_on_floor():
		get_parent().change_state("Idle")

func exit():
	sprite.stop()
