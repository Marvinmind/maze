extends Node



func _ready():
	pass

func _on_Control_start_game():
	var gameScene = load("res://Game.tscn")
	remove_child($Control)
	var Game = gameScene.instance()
	add_child(Game, true)
	$Game.connect("game_root_ended", self, "_on_Game_game_ended")


func _on_Game_game_ended():
	print("ending game in main")
	var children = get_children()
	print(children)
	var endScreenScene = load("res://EndScreen.tscn")
	remove_child($Game)
	var endScreen = endScreenScene.instance()
	add_child(endScreen)

