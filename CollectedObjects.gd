extends TileMap

signal game_ended

var collected_tiles = []

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GameObjects_tile_collected(tile):
	emit_signal("game_ended")
	if tile == 3:
		if collected_tiles.size() == 3:
			emit_signal("game_ended")
	else:
		if collected_tiles.find(tile) == -1:
			collected_tiles.push_back(tile)
			set_cell(tile, 21 , tile)
		
