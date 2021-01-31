extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialog = ["Oh no, I lost my stuff! Can you help me collect it? \nLet's hurry, before it gets dark......","That was the last item, AWESEOME! \nLet's go home!"]
var page = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)


func _on_CollectedObjects_all_items_collected():
	page = 1
	_ready()

