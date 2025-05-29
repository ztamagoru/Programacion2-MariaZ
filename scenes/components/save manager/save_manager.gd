extends Node

var save_data : Dictionary = {
	"hp" : 0
	, "mana" : 0
	, "coins" : 0
	, "double_jump" : true
	}

var route : String = "user://save_file.save"

func _ready():
	Globals.save_manager = self
	load_game()

func save_game():
	if not FileAccess.file_exists(route):
		set_default_save_data()
		print("new save file created")
	else:
		set_current_player_data()
	
	var save_file = FileAccess.open(route, FileAccess.WRITE)
	save_file.store_line(JSON.stringify(save_data))

func load_game():
	if not FileAccess.file_exists(route):
		save_game()
		return
	
	var save_file = FileAccess.open(route, FileAccess.READ)
	var save_file_text = save_file.get_line()
	var json = JSON.new()
	
	json.parse(save_file_text)
	save_data = json.data

func set_default_save_data():
	save_data.hp = Globals.player.hp_max
	save_data.mana = Globals.player.mana_max
	save_data.coins = 0
	save_data.double_jump = false

func set_current_player_data():
	save_data.hp = Globals.player.hp
	save_data.mana = Globals.player.mana
	save_data.coins = Globals.player.coins
	save_data.double_jump = Globals.player.double_jump
