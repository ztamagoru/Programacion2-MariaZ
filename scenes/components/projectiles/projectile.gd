extends Area2D
class_name Projectile

@export var projectile_speed : float
@export var projectile_gravity : float
@export var hitbox : Area2D

var direction : int

func _ready():
	pass

func _process(_delta): 
	pass

func check_structure():
	for collision in hitbox.get_overlapping_bodies():
		if collision.is_in_group("structure"):
			despawn()

func despawn():
	queue_free()
