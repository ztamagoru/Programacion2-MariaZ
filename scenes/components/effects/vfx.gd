extends Sprite2D
class_name Effects

var time_limit : int
var timeleft : int = 1

var speed : float = 50.0
var current_speed : float = 0.0

var distance_player : int = 25

func _ready():
	print("hp vfx")
	modulate.a = 100
	if is_instance_valid(Globals.player):
		global_position = Globals.player.global_position

func _process(_delta):
	pass

func move_up(delta):
	current_speed += speed * delta
	global_position.y -= current_speed
	
	modulate.a -= speed * delta

func follow_player(): # use in case vfx is applied to the player
	if is_instance_valid(Globals.player):
		global_position = Globals.player.global_position
		if Globals.player.velocity.x < 0:
			position.x += distance_player
		elif Globals.player.velocity.x > 0:
			position.x -= distance_player
