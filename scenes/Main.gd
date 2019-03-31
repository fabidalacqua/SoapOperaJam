extends Control

var wait = false

func _ready():
	$AudioStreamPlayer2D.play()

func _process(delta):
	if !wait and $Button.start:
		$VS.visible = true
		$Timer.start()
		wait = true
	
	if wait and $Timer.time_left == 0:
			get_tree().change_scene("res://scenes/Game.tscn")
