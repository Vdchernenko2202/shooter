extends Node2D

@export var fire_positions: PackedVector2Array

@onready var green_laser = preload("res://scenes/Green Laser.tscn")

@onready var timer = $Countdown

@onready var space = get_node("/root/Space")


func _process(_delta):
	if _is_ready_to_fire():
		_fire()


func _fire():
	timer.wait_time = space.meteor_spawn_delay / 2
	timer.start()

	for pos in fire_positions:
		var laser = green_laser.instantiate()
		laser.set_as_top_level(true)
		laser.position = owner.position + pos
		add_child(laser)


func _is_ready_to_fire() -> bool:
	return timer.is_stopped() and Input.is_action_pressed("KEY_FIRE")
