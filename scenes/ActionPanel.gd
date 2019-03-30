extends Node2D

func _ready():
	$Defense.change_sprite("defense")
	$Life.change_sprite("life")
	$Charge.change_sprite("charge")
	$Attack.change_sprite("attack")

func set_visible(var visible):
	self.visible = visible