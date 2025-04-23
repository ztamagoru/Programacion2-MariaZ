extends Control

var hp : int
var mana : int

var hp_max : int
var mana_max : int

var coins : int = 500

#region "onready's"

@onready var hp_bar =		$MarginContainer/StatsContainer/HPContainer/HPProgressBar
@onready var hp_text =  	$MarginContainer/StatsContainer/HPContainer/HPLabel

@onready var mana_bar = 	$MarginContainer/StatsContainer/ManaContainer/ManaProgressBar
@onready var mana_text =	$MarginContainer/StatsContainer/ManaContainer/ManaLabel

@onready var coins_text =	$MarginContainer/VBoxContainer/HBoxContainer/CoinsLabel

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
	
