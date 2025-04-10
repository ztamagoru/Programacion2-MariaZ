extends Control

var hp : int	= 100
var mana : int	= 33
var coins : int = 500

var hp_max : int	= 200
var mana_max : int	= 150

@onready var hp_bar =		$MarginContainer/StatsContainer/HPContainer/HPProgressBar
@onready var hp_text =  	$MarginContainer/StatsContainer/HPContainer/HPLabel

@onready var mana_bar = 	$MarginContainer/StatsContainer/ManaContainer/ManaProgressBar
@onready var mana_text =	$MarginContainer/StatsContainer/ManaContainer/ManaLabel

@onready var coins_text =	$MarginContainer/VBoxContainer/HBoxContainer/CoinsLabel

func _ready():
	hp_bar.max_value = hp_max
	mana_bar.max_value = mana_max

func _process(_delta):
	hp_bar.value = hp
	hp_text.text = str(hp)
	
	mana_bar.value = mana
	mana_text.text = str(mana)
	
	coins_text.text = str(coins)
