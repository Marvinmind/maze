extends Node




func _on_Control_start_game():
	var game = load("res://Game.tscn")
	print("starting game")
	remove_child($Control)
	var x = game.instance()
	add_child(x)
