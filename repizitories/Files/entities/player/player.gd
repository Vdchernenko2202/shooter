extends CharacterBody2D

class_name Player

@export var speed = 400

@onready var _animation_player = $Ship
@onready var _animation_death = $death

# y axis limits
const MAX_TOP_POSITION: int = 48
const MAX_DOWN_POSITION: int = 640 - MAX_TOP_POSITION

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed


func _process(_delta): 
	if Input.is_action_pressed("ui_left"):
		_animation_player.play("turn_left")
		_animation_player.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		_animation_player.play("turn_right")
		_animation_player.flip_h = true
	else:
		_animation_player.play("turn_back")
		

func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	# limits player position on y axis
	position.x = clamp(position.x, 26, 442)
	position.y = clamp(position.y, 26, 615)


