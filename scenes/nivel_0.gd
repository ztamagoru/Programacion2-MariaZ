extends Node2D

func _process(_delta):
	if not is_instance_valid(Globals.player):
		if Input.is_key_pressed(KEY_R):
			get_tree().reload_current_scene()

func _ready():
	await get_tree().process_frame
	
	Globals.player.camera.offset = Vector2(0.0,-100.0)
	
	Globals.player.camera.limit_top = -1300
	Globals.player.camera.limit_bottom = 1300
	Globals.player.camera.limit_left = -500
	Globals.player.camera.limit_right = 2750
	
	Globals.player.camera.zoom = Vector2(0.75,0.75)
