extends Node2D

const IDLE_DURATION = 1.0
export var move_to = Vector2.RIGHT*192
export var speed = 3.0
export var timer_time = 0
onready var platform = $platform
onready var tween = $moveTween

var follow = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = timer_time
	$Timer.start()
	_init_tween()
	
func _init_tween():
	var duration = move_to.length() / float(speed * 16)
	tween.interpolate_property(self, "follow" , Vector2.ZERO, move_to, duration ,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(self, "follow" ,  move_to, Vector2.ZERO, duration ,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + IDLE_DURATION * 2)
	#tween.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	platform.position = platform.position.linear_interpolate(follow, 0.075)
	
	pass


func _on_Timer_timeout():
	tween.start()
	#print("timer finish " ,timer_time)
	pass # Replace with function body.
