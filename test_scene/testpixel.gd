extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var placing = false
export var placed = false
var horizontal = false
var rotated = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalsAndSignals.connect("place_cable", self, "_on_place_cable")
#	GlobalsAndSignals.connect("start_cable", self, "_on_start_cable")
	GlobalsAndSignals.connect("cancel_cable", self, "_on_cancel_cable")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(position)
	if placing == true:
		GlobalsAndSignals.placing_position = Vector2(position.x/32,position.y/32)
		position = get_global_mouse_position().snapped(Vector2(32,32))
		if Input.is_action_just_pressed("rotate"):
			rotation_degrees += 90
			if rotated == false:
				rotated = true
			elif rotated == true:
				rotated = false

func _on_place_cable():
	if placing == true:
		if rotated == false:
			GlobalsAndSignals.connected_positions.append(Vector2(GlobalsAndSignals.placing_position[0]+32,GlobalsAndSignals.placing_position[1]))
		placing = false

#func _on_start_cable():
#	pass

func _on_cancel_cable():
	if placing == true:
		GlobalsAndSignals.placing_cable = false
		queue_free()
