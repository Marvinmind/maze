extends TileMap

signal tile_collected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_collided(collision):
	if collision.collider.name == "GameObjects":
		var sprite = get_node("../AnimatedSprite")
		var tile_pos = collision.collider.world_to_map(sprite.position)
		tile_pos -= collision.normal
		var tile = collision.collider.get_cellv(tile_pos)
		emit_signal("tile_collected", tile)
