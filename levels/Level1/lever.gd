extends Area2D
var use_lever = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if use_lever:
		$Sprite.flip_h = true
		$"..".lever1 = true

		
#	pass


func _on_lever_area_entered(area):
	if area.name == 'use':
	 	use_lever = true
	pass # Replace with function body.
