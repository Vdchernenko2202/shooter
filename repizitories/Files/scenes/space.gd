extends Node2D

class_name Space
@onready var pause_menu = $Pausemenu
var paused = false
@onready var meteor = preload("res://scenes/Meteor.tscn")
@onready var meteor2 = preload("res://scenes/Meteor2.tscn")
@onready var score_label = $HBoxContainer/Label
@onready var meteor_countdown = $MeteorCountdown


var restart = false
var score = 0
var meteor_spawn_delay = 2



func _ready():
	meteor_countdown.wait_time = meteor_spawn_delay * 2
	meteor_countdown.start()


func _process(_delta):
	if Input.is_action_just_pressed("KEY_RESTART"):
		var error = get_tree().reload_current_scene()
		if not error == OK:
			print(error)
	if $musicgame.playing == false:
		$musicgame.play()
	pass

	spawn_meteors()

	if !restart:
		count_score()
	else:
		score_label.text = "Press  R  to  restart"
	
	if Input.is_action_just_pressed("pause"):
		pausemMenu()

func pausemMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

	
func count_score():
	score += Constants.SCORE_COUNT
	score_label.text = str(round(score))


func spawn_meteors():
	if meteor_countdown.is_stopped():
		var m = meteor.instantiate()
		m.position = pick_random_position()
		add_child(m)
	if meteor_countdown.is_stopped():
		var m2 = meteor2.instantiate()
		m2.position = _pick_random_position()
		add_child(m2)
		
		
		meteor_spawn_delay -= score * Constants.SPAWN_RATE_MULTIPLIER
		meteor_spawn_delay = max(Constants.SPAWN_RATE_MULTIPLIER, 
			meteor_spawn_delay)
		meteor_countdown.wait_time = meteor_spawn_delay
		meteor_countdown.start()

		
func pick_random_position() -> Vector2:
	return Vector2((randf() * get_window().size.x), (get_window().size.y - 690)) 

func _pick_random_position() -> Vector2:
	return Vector2((randf() * get_window().size.x), (get_window().size.y - 1100)) 
