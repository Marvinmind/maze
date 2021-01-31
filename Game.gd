extends Node

signal game_root_ended

var night_time = false

const ACCELERATION = 1000
const MAX_SPEED = 200
const FRICTION = 2000

const OBJ_NUM = 3

var screen_size  # Size of the game window.

var velocity = Vector2.ZERO
var rotation = Vector2.ZERO
var direction = Vector2.ZERO  # The player's movement vector.

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	emit_signal("game_root_ended")
	$NightFall.start()
	setSprites()
	setHome()

func _on_NightFall_timeout():
	$Player.get_node("Light2D").enabled = true
	$NightFall.stop()
	$DayBreak.start()


func _on_DayBreak_timeout():
	$Player.get_node("Light2D").enabled = false
	$DayBreak.stop()
	$NightFall.start()

func setSprites():

	var cells = $maze_generator.get_used_cells_by_id($maze_generator.PATH_ID)
	var index = randi() % cells.size()
	var selectedCell = cells[index]
	print("setting")
	for i in OBJ_NUM:
		$GameObjects.set_cell(selectedCell[0], selectedCell[1], i)
		index = randi() % cells.size()
		selectedCell = cells[index]
		
func setHome():
	$maze_generator.set_cell(31,18,-1)
	$GameObjects.set_cell(30,18,4)
	$GameObjects.set_cell(31,18,3)
	$GameObjects.set_cell(32,18,5)
	$GameObjects.set_cell(30,19,6)
	$GameObjects.set_cell(31,19,7)
	$GameObjects.set_cell(32,19,8)
	

func _on_CollectedObjects_game_ended():
	print("GameEnded in root Game")
	emit_signal("game_root_ended")
