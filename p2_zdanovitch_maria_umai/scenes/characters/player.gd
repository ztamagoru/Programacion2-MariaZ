extends CharacterBody2D

var speed = 100

func _physics_process(delta):
	var direccion = Input.get_axis("move_left", "move_right")
	velocity.x = direccion * speed
	
	if velocity > Vector2.ZERO:
		move_and_slide()
