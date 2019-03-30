extends Node2D

func _ready():
	pass

func _process(delta):
	if $Player1.ready and $Player2.ready:
		$Player1.play_animation()
		$Player2.play_animation()
		
		$Player1.ready = false
		$Player2.ready = false
		
		if $Player1.is_attacking:
			$Player1.is_attacking = false
			$Player2.getting_hit("2")
		if $Player2.is_attacking:
			$Player2.is_attacking = false
			$Player1.getting_hit("1")
		
	if $Player1.is_dead() or $Player2.is_dead():
		end_game()
		
func end_game():
	print("Acabou")
	get_tree().change_scene("res://scenes/Main.tscn")