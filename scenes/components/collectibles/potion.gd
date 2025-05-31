extends Collectibles

var value : int = 20

#func _ready():
	#

func grab_item():
	if Globals.player.hp < Globals.player.hp_max:
		if Globals.player.hp >= Globals.player.hp_max - value:
			Globals.player.hp = Globals.player.hp_max
		else:
			Globals.player.hp += value 
	queue_free()
	pass
