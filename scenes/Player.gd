extends Node2D

var ready = false
var vulnerable = true
var is_charged = true
var is_attacking = false
var is_dead = false
var animation = "idle"
var end_game = false

func _ready():
	$ProgressBar.initialize(3)
	$Effect.visible = false
	$Charge.visible = true
	$Charge.play("charged")

func _process(delta):
	if !end_game:
		if !ready:
			$ActionPanel.set_visible(true)
			
			if $ActionPanel/Defense.choosen:
				$ActionPanel/Defense.choosen = false
				vulnerable = false
				animation = "defense"
				ready = true
			elif $ActionPanel/Life.choosen:
				$ActionPanel/Life.choosen = false
				$ProgressBar.set_hp(1)
				animation = "life"
				ready = true
			elif $ActionPanel/Charge.choosen:
				$ActionPanel/Charge.choosen = false
				is_charged = true
				$ActionPanel/Attack.change_sprite("attack")
				$ActionPanel/Attack/CollisionShape2D.disabled = false
				animation = "charge"
				ready = true
			elif $ActionPanel/Attack.choosen:
				$ActionPanel/Attack.choosen = false
				is_charged = false
				is_attacking = true
				$ActionPanel/Attack.change_sprite("disabled_attack")
				$ActionPanel/Attack/CollisionShape2D.disabled = true
				animation = "attack"
				ready = true
		if ready:
			$ActionPanel.set_visible(false)
			
	if ($AnimatedSprite.animation == "attack" and $AnimatedSprite.frame == 3) or \
		($AnimatedSprite.animation == "hit" and $AnimatedSprite.frame == 1):
		$AnimatedSprite.animation = "idle"
	if $Effect.visible and \
		(($Effect.animation == "defense" and $Effect.frame == 5) or \
		($Effect.animation == "life" and $Effect.frame == 7)):
			$Effect.visible = false

func getting_hit():
	if vulnerable:
		$ProgressBar.set_hp(-1)
		$AnimatedSprite.play("hit")
	else:
		vulnerable = true
		
func is_dead():
	return $ProgressBar.get_hp() == 0
	
func play_animation():
	if animation == "attack" or animation == "loose":
		$Charge.visible = false
		$AnimatedSprite.play(animation)
	else:
		if animation == "charge":
			$Charge.visible = true
		else:
			$Effect.visible = true
			$Effect.play(animation)