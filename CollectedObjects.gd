extends TileMap

signal game_ended

signal all_items_collected

var collected_tiles = []
var all_items_collected = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GameObjects_tile_collected(tile):
	print(tile)
	if tile == 3:
		if collected_tiles.size() >= 3:
			print("emmiting game ended from CollectedObjects")
			emit_signal("game_ended")
	else:
		if collected_tiles.find(tile) == -1:
			collected_tiles.push_back(tile)
			set_cell(tile, 21 , tile)
		
		if collected_tiles.size() == 3 && !all_items_collected:
			print("emmiting all items colelcted")
			emit_signal("all_items_collected")
			all_items_collected = true 
