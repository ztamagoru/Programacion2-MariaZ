extends Projectile

var velocity_y : float = -150

func _process(delta): 
	check_structure()
	
	for collision in hitbox.get_overlapping_bodies():
		if collision.is_in_group("player"):
			despawn()
			Globals.player.take_damage(10)
	
	position.y += velocity_y * delta
	
	if velocity_y < projectile_gravity:
		velocity_y += projectile_gravity * delta
	
	position.x += projectile_speed * direction * delta # right = 1, left = -1
	
