extends Area2D

@onready var space = get_parent()
@onready var notifier = $VisibleOnScreenNotifier2D
@onready var enemy = preload("res://scenes/Meteor2.tscn")

const SPEED = 500
var speed = 0


func _ready():
	speed = SPEED + Constants.METEOR_SPEED_MULTIPLIER * space.score


func _physics_process(delta):
	position += Vector2.DOWN * speed * delta
	
	
func _process(_delta):
	if not notifier.is_on_screen():
		queue_free()



func _on_area_entered(area):
	if area is Laser:
		area.queue_free()
		queue_free()


func _on_body_entered(body):
	if body is Player:
		space.restart = true
		body.queue_free()
		queue_free()
