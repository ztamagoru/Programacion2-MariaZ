extends CharacterBody2D

@export var speed : float
@export var gravity : float
@export var jump_force : float 

@export var hud : Control

@export var camera : Camera2D

var hp : int 
var mana : int

var hp_max : int = 100
var mana_max : int = 100

var coins : int 

var double_jump : bool
var jump_count : int

func _ready():
	Globals.player = self
	#initialize_player()
	
	await get_tree().process_frame
	coins = Globals.save_manager.save_data.coins
	hp = Globals.save_manager.save_data.hp
	mana = Globals.save_manager.save_data.mana
	double_jump = Globals.save_manager.save_data.double_jump

func initialize_player():
	jump_count = 0
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
	
	blink()
	#Globals.blink(self)

func blink():
	self.modulate.a = 0
	await get_tree().create_timer(0.1).timeout
	self.modulate.a = 100
	await get_tree().create_timer(0.1).timeout

func update_hud():
	hud.hp = hp
	hud.hp_max = hp_max
	hud.mana = mana
	hud.mana_max = mana_max
	hud.coins = coins
	
	hud.update_values()
