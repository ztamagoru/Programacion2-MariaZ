extends Collectibles

var value : int = 10

var vfx_scene = preload("res://scenes/components/effects/money_vfx.tscn")

func grab_item():
	Globals.player.coins += value
	player_grab_vfx(vfx_scene)
	queue_free()
	pass
