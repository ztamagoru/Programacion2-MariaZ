extends Node2D

func _process(_delta):
	if not is_instance_valid(Globals.player):
		if Input.is_key_pressed(KEY_R):
			get_tree().reload_current_scene()
