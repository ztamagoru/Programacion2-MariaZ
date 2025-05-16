extends Collectibles

func grab_item():
	Globals.player.coins += 1
	queue_free()
	pass
