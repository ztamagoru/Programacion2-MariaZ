extends Collectibles

var value : int = 10

func grab_item():
	Globals.player.coins += value
	queue_free()
	pass
