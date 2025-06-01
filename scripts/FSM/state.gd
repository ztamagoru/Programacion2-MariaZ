extends Node2D
class_name State

var player : CharacterBody2D
var sprite : AnimatedSprite2D

func _ready():
	player = get_parent().player
	sprite = get_parent().sprite

func enter():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass

func exit():
	pass
