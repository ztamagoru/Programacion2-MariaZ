extends Collectibles

var value : int = 1

func grab_item():
	Globals.player.coins += value
	queue_free()
	pass
