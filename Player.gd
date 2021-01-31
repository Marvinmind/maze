extends KinematicBody2D

signal collided

const ACCELERATION = 1000
const MAX_SPEED = 200
const FRICTION = 2000


var velocity = Vector2.ZERO
var rotationVector = Vector2.ZERO
var direction = Vector2.ZERO  # The player's movement vector.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		rotationVector = rotationVector.move_toward(direction, delta*10)
		$AnimatedSprite2.play()
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		$AnimatedSprite2.stop()
		$AnimatedSprite2.set_frame(0)
	
	var _something = move_and_slide(velocity)
	rotation = rotationVector.angle()

func _physics_process(_delta):
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision:
			emit_signal('collided', collision)
