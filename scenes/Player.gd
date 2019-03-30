extends Node2D

var ready = false
var vulnerable = true
var is_charged = true
var is_attacking = false
var is_dead = false

func _ready():
	$ProgressBar.initialize(3)

func _process(delta):
	if !ready:
		$ActionPanel.set_visible(true)
		
		if $ActionPanel/Defense.choosen:
			print("Escolhi defesa!")
			$ActionPanel/Defense.choosen = false
			vulnerable = false
			# prepara animação de defesa
			ready = true
		elif $ActionPanel/Life.choosen:
			print("Escolhi vida!")
			$ActionPanel/Life.choosen = false
			$ProgressBar.set_hp(1)
			# prepara animacao de tomar vida
			ready = true
		elif $ActionPanel/Charge.choosen:
			print("Escolhi carregar!")
			$ActionPanel/Charge.choosen = false
			is_charged = true
			$ActionPanel/Attack.change_sprite("attack")
			$ActionPanel/Attack/CollisionShape2D.disabled = false
			# prepara animacao de carregar
			ready = true
		elif $ActionPanel/Attack.choosen:
			print("Escolhi atacar!")
			$ActionPanel/Attack.choosen = false
			is_charged = false
			is_attacking = true
			$ActionPanel/Attack.change_sprite("disabled_attack")
			$ActionPanel/Attack/CollisionShape2D.disabled = true
			# prepara animacao de ataque
			ready = true
	
	if ready:
		$ActionPanel.set_visible(false)

func getting_hit(var player):
	if vulnerable:
		print("Estou vulneravel!" + player)
		$ProgressBar.set_hp(-1)
	else:
		print("Estou defendendo!" + player)
		vulnerable = true
		
func is_dead():
	return $ProgressBar.get_hp() == 0
	
func play_animation():
	pass