extends Control

var hp : int
var mana : int

var hp_max : int
var mana_max : int

var coins : int

#region "exports"

@export var hp_bar : ProgressBar
@export var hp_text : Label

@export var mana_bar : ProgressBar
@export var mana_text : Label

@export var coins_text : Label

#endregion

func _ready():
	update_values()

func _process(_delta):
	hp_bar.value = hp
	hp_text.text = str(hp)
	
	mana_bar.value = mana
	mana_text.text = str(mana)
	
	coins_text.text = str(coins)

func update_values():
	hp_bar.max_value = hp_max
	mana_bar.max_value = mana_max
	
