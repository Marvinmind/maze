extends Node


var night_time = false

const ACCELERATION = 1000
const MAX_SPEED = 200
const FRICTION = 2000

var screen_size  # Size of the game window.

var velocity = Vector2.ZERO
var rotation = Vector2.ZERO
var direction = Vector2.ZERO  # The player's movement vector.

# Called when the node enters the scene tree for the first time.
func _ready():
	$NightFall.start()
	setSprites()



func _process(delta):

	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		rotation = rotation.move_toward(direction, delta*10)
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	


		
	$AnimatedSprite.move_and_slide(velocity)
	$AnimatedSprite.rotation = rotation.angle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NightFall_timeout():
	$AnimatedSprite.get_node("Light2D").enabled = true
	$NightFall.stop()
	$DayBreak.start()


func _on_DayBreak_timeout():
	$AnimatedSprite.get_node("Light2D").enabled = false
	$DayBreak.stop()
	$NightFall.start()
	

func setSprites():
	var cells = $maze_generator.get_used_cells_by_id(1)
	var index = randi() % cells.size()
	var selectedCell = cells[index]
	$maze_generator.set_cell(selectedCell[0], selectedCell[1], 0)
