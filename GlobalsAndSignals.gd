extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_pos
var placing_cable = false
var placing_position = Vector2()
var occupied_positions = []
var connected_positions = []
signal check_cable
signal place_cable
signal cancel_cable

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
