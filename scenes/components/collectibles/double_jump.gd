extends Collectibles

func _ready():
	Globals.double_jump_collectible = self

func grab_item():
	Globals.player.double_jump = true
	queue_free()
	pass
