extends CharacterBody2D

@export var speed : float = 125.0
@export var gravity : float = 250.0
@export var jump_force : float = 200.0

@export var hud : Control

var hp : int 
var mana : int

var hp_max : int = 100
var mana_max : int = 100

var coins :int 

func ready(_delta):
	initialize_player()
	update_hud()

func initialize_player():
	hp = hp_max
	mana = mana_max
	coins = 0

func _physics_process(_delta):
	#if velocity.y != 0:
		#print(str(velocity.y))
	pass

func player_die():
	queue_free()

func receive_damage(damage : int):
	hp -= damage
	if hp <= 0:
		player_die()

func update_hud():
	hud.hp = hp
	hud.hp_max = hp_max
	hud.mana = mana
	hud.mana_max = mana_max

	hud.update_values()
