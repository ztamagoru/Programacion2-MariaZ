extends Enemy

@export var hitbox : Area2D
@export var timer : Timer

var position_start : Vector2 # = position
var distance_limit : int = 50
var enemy_speed : float = 5000.0

var direction : Vector2 = Vector2(1,0)

var move_right : bool = false

func _ready():
	position_start = position

func _physics_process(delta):
	movement(delta)
	#attack()

func movement(delta):
	velocity = direction * enemy_speed * delta
	
	if position.distance_to(position_start) >= distance_limit:
		direction = position.direction_to(position_start)
	
	move_and_slide()

func _on_timer_attack_timeout() -> void:
	#print(hitbox.get_overlapping_bodies())
	for body in hitbox.get_overlapping_bodies():
		if body.is_in_group("player"):
			body.take_damage(10)
			print("damage")
