extends State

func enter():
	sprite.play("anim_" + name)
	print("falling")

func update(_delta):
	pass

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	if player.velocity.y < player.gravity:
		player.velocity.y += player.gravity * delta
	
	player.velocity.x = direction * player.speed * delta
	
	if player.is_on_floor():
		get_parent().change_state("Idle")
	
	player.move_and_slide()

func exit():
	sprite.stop()
