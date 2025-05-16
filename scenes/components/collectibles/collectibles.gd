extends Area2D
class_name Collectibles

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			grab_item()

func grab_item():
	pass
