extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var test_pixel = preload("res://test_scene/testpixel.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		if GlobalsAndSignals.placing_cable == false:
			print("PLACING")
			var test_pixelInstance = test_pixel.instance()
			test_pixelInstance.position = get_global_mouse_position()
			test_pixelInstance.placing = true
			get_tree().get_root().add_child(test_pixelInstance)
			GlobalsAndSignals.placing_cable = true
		elif GlobalsAndSignals.placing_cable == true and GlobalsAndSignals.occupied_positions.find(GlobalsAndSignals.placing_position) == -1:
			print("PLACED")
			GlobalsAndSignals.emit_signal("place_cable")
			GlobalsAndSignals.emit_signal("check_cable")
			GlobalsAndSignals.occupied_positions.append(GlobalsAndSignals.placing_position)
			GlobalsAndSignals.placing_cable = false
	if Input.is_action_just_pressed("ui_cancel"):
		if GlobalsAndSignals.placing_cable == true:
			GlobalsAndSignals.emit_signal("cancel_cable")
