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


func _on_NightFall_timeout():
	$Player.get_node("Light2D").enabled = true
	$NightFall.stop()
	$DayBreak.start()



func _on_DayBreak_timeout():
	$Player.get_node("Light2D").enabled = false
	$DayBreak.stop()
	$NightFall.start()

	

func setSprites():
	var cells = $maze_generator.get_used_cells_by_id(1)
	var index = randi() % cells.size()
	var tile = randi() % 2
	var selectedCell = cells[index]
	print("setting")
	$GameObjects.set_cell(selectedCell[0], selectedCell[1], tile)
