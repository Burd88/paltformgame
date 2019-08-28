extends Area2D
var use_lever = false

func _process(delta):
	if use_lever:
		$Sprite.flip_h = true
		$"..".lever1 = true

func _on_lever_area_entered(area):
	if area.name == 'use':
	 	use_lever = true
	pass