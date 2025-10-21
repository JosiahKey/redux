class_name room
extends TextureButton

var tier = 0
var lateral = 0
var coord: Vector2 = Vector2(0,0)
var global_coord: Vector2
var texture_norm = load("res://random_tree_thing/Tilesets/img_src/room_open.png")
var texture_dis = load("res://random_tree_thing/Tilesets/img_src/room_closed.png")
var world_data: PackedScene
var connections: Array[Vector2] = []
var is_accessable: bool = false
var CELL_SIZE = 16

func random_map() -> PackedScene:
	#randi_range()
	return load("res://random_tree_thing/Scenes/debug_level.tscn")

func _init(rm: Vector2) -> void:
	self.disabled = true
	tier = rm.x
	lateral = rm.y
	texture_normal = texture_norm
	texture_disabled = texture_dis
	coord = rm
	global_coord = self.global_position
	world_data = random_map()
	connections = [Vector2(tier+CELL_SIZE,lateral-CELL_SIZE),
	Vector2(tier+CELL_SIZE,CELL_SIZE),
	Vector2(tier+CELL_SIZE,lateral+CELL_SIZE)
	]

func _pressed() -> void:
	pass#pressed.emit()
