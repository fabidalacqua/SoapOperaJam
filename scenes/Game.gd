extends Node2D

var start_timer = false

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
			$Player2.getting_hit()
		if $Player2.is_attacking:
			$Player2.is_attacking = false
			$Player1.getting_hit()
	
	check_end()
	
	if $Player1.end_game and start_timer and $Timer.time_left == 0:
		get_tree().change_scene("res://scenes/Main.tscn")

func check_end():
	if $Player1.is_dead():
		$Player1.animation = "loose"
		$Player1.play_animation();
		$Player1/Loose.visible = true
		end_game()
	if $Player2.is_dead():
		$Player2.animation = "loose"
		$Player2.play_animation();
		$Player2/Loose.visible = true
		end_game()
	
func end_game():
	$Player1.end_game = true
	$Player2.end_game = true	
	$Player1/ActionPanel.set_visible(false)
	$Player2/ActionPanel.set_visible(false)
	if !start_timer:
		$Timer.start()
		start_timer = true