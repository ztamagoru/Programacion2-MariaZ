extends Enemy

@export var cd_timer : Timer

var distance_limit : int = 50
var agro_vision : int = 500

var enemy_speed : float = 5000.0

var position_start : Vector2 # = position
var direction : Vector2 = Vector2(1,0)

var shoot_cd : bool = true
var projectile_scene = preload("res://scenes/components/projectiles/enemy_projectile.tscn")

func _ready():
	position_start = position

func _physics_process(delta):
	if is_instance_valid(Globals.player):
		if global_position.distance_to(Globals.player.position) <= agro_vision:
			if shoot_cd: shoot()
		else:
			#print("not agro")
			movement(delta)
	else:
		movement(delta)

func movement(delta):
	velocity = direction * enemy_speed * delta
	
	if position.distance_to(position_start) >= distance_limit:
		direction = position.direction_to(position_start)
	
	move_and_slide()

func shoot():
	var projectile = projectile_scene.instantiate()
	
	shoot_cd = false
	cd_timer.start(2.0)
	
	projectile.top_level = true
	projectile.z_index = 3
	projectile.global_position = global_position
	
	if global_position.x < Globals.player.global_position.x: # right = 1, left = -1
		projectile.direction = 1
	else:
		projectile.direction = -1
	
	add_child(projectile)
	

func _on_shoot_cooldown_timeout() -> void:
	shoot_cd = true
