extends Effects

func _process(_delta):
	follow_player()
	move_up(_delta)
	

func _on_timer_timeout():
	queue_free()
