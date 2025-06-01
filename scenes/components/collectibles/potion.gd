extends Collectibles

var value : int = 20

var vfx_scene = preload("res://scenes/components/effects/hp_vfx.tscn")

func grab_item():
	if Globals.player.hp < Globals.player.hp_max:
		if Globals.player.hp >= Globals.player.hp_max - value:
			Globals.player.hp = Globals.player.hp_max
		else:
			Globals.player.hp += value 
		
		player_grab_vfx(vfx_scene)
	
	queue_free()
