extends Node2D

@export var tilemap_interactables : TileMapLayer
var mid_coin = preload("res://scenes/components/collectibles/mid_coin.tscn")

func _process(_delta):
	if not is_instance_valid(Globals.player):
		if Input.is_key_pressed(KEY_R):
			get_tree().reload_current_scene()

func _ready():
	await get_tree().process_frame
	
	if Globals.player.double_jump:
		if is_instance_valid(Globals.double_jump_collectible):
			var collectible_local_pos = tilemap_interactables.to_local(Globals.double_jump_collectible.global_position)
			var cell_pos = tilemap_interactables.local_to_map(collectible_local_pos)
			
			var coin = mid_coin.instantiate()
			
			coin.position = tilemap_interactables.map_to_local(cell_pos)
			tilemap_interactables.add_child(coin)
			
			Globals.double_jump_collectible.queue_free()
	
	Globals.player.camera.offset = Vector2(0.0,-100.0)
	
	Globals.player.camera.limit_top = -1300
	Globals.player.camera.limit_bottom = 1300
	Globals.player.camera.limit_left = -500
	Globals.player.camera.limit_right = 2750
	
	Globals.player.camera.zoom = Vector2(0.75,0.75)
