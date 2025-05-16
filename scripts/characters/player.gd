extends CharacterBody2D

@export var speed : float = 10000.0
@export var gravity : float = 350.0
@export var jump_force : float = 300.0

@export var hud : Control

var hp : int 
var mana : int

var hp_max : int = 100
var mana_max : int = 100

var coins : int 

func _ready():
	Globals.player = self
	#initialize_player()
	
	await get_tree().process_frame
	coins = Globals.save_manager.save_data.coins
	hp = Globals.save_manager.save_data.hp
	mana = Globals.save_manager.save_data.mana

func initialize_player():
	hp = hp_max
	mana = mana_max

func _physics_process(_delta):
	update_hud()
	
	if Input.is_key_pressed(KEY_ESCAPE):
		await Globals.save_manager.save_game()
		get_tree().quit()
		
	#print(coins)

func player_die():
	queue_free()

func take_damage(damage : int):
	hp -= damage
	if hp <= 0:
		player_die()

func update_hud():
	hud.hp = hp
	hud.hp_max = hp_max
	hud.mana = mana
	hud.mana_max = mana_max
	hud.coins = coins
	
	hud.update_values()
