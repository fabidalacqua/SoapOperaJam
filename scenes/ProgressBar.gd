extends ProgressBar

func initialize(var hp):
	self.value = hp

func set_hp(var hp):
	self.value += hp
	
func get_hp():
	return self.value