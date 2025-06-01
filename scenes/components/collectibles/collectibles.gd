extends Area2D
class_name Collectibles

func _process(_delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			grab_item()

func grab_item():
	pass

func player_grab_vfx(scene):
	var vfx = scene.instantiate()
	
	vfx.top_level = true
	vfx.z_index = 150
	vfx.global_position = Globals.player.global_position
	
	get_tree().current_scene.add_child(vfx)
