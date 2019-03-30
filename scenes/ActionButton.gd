extends Area2D

var choosen = false

func _ready():
	pass
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		self.on_click()

func on_click():
	choosen = true
	
func change_sprite(var name):
	$Sprite.texture = load("res://sprites/"+name+".png")