extends Area2D

class_name Laser

@export var speed = 2000

@onready var notifier = $Notifier

func _physics_process(delta):
	position += transform.x * speed * delta
	
	
func _process(_delta):
	if not notifier.is_on_screen():
		queue_free()
 
