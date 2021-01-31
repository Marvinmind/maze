extends TileMap

signal tile_collected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_collided(collision):
	if collision.collider.name == "GameObjects":
		var sprite = get_node("../Player")
		var tile_pos = collision.collider.world_to_map(sprite.position)

		tile_pos -= collision.normal
		var tile = collision.collider.get_cellv(tile_pos)

		if tile != 3:
			set_cell(tile_pos[0], tile_pos[1], -1)
		emit_signal("tile_collected", tile)
		
		

