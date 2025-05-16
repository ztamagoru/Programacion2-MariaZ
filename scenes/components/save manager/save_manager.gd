extends Node

var save_data : Dictionary = {
	"hp" : 0
	, "mana" : 0
	, "coins" : 0
	}

func _ready():
	Globals.save_manager = self
	load_game()

func save_game():
	save_data.hp = Globals.player.hp
	save_data.mana = Globals.player.mana
	save_data.coins = Globals.player.coins
	
	var save_file = FileAccess.open("user://save_file.save", FileAccess.WRITE)
	save_file.store_line(JSON.stringify(save_data))

func load_game():
	var save_file = FileAccess.open("user://save_file.save", FileAccess.READ)
	var save_file_text = save_file.get_line()
	var json = JSON.new()
	
	json.parse(save_file_text)
	save_data = json.data
