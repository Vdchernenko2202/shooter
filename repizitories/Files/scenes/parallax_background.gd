extends ParallaxBackground

@onready var space = get_parent()

const SPEED: float = 400.0
var speed = 0

func _process(delta):
	speed = SPEED + space.score * Constants.BACKGROUND_SPEED_MULTIPLIER
	scroll_offset.y += SPEED * delta
