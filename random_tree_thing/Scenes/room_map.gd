extends Node2D

#this could probably be done alot easier with Tree and Tree item
#in fact for drawing connections, I must insist this be redone with TREE

@onready var master_ref = $master_layout
@onready var world_ref = $World
@onready var tier_scene = preload("res://random_tree_thing/Scenes/tiers.tscn")
var test_layout: Array[Vector2] = [
	Vector2(0,0),
	Vector2(1,0),Vector2(1,1),Vector2(1,2),
	Vector2(2,0),Vector2(2,1),Vector2(2,2),Vector2(2,3),
	Vector2(3,0),
]
var rooms_layout: Array[room]
var tier_tracker_buttons = 0

func _ready() -> void:
	rooms_layout = create_rooms()
	draw_rooms()
	rooms_layout[0].disabled = false

func create_rooms() -> Array[room]:
	var result: Array[room]
	for r in test_layout:
		result.append(room.new(r))
	return result

func draw_rooms() -> void:
	#create first tier
	master_ref.add_child(tier_scene.instantiate())
	var tier_tracker = 0
	var newest_child: room
	
	#draw rooms
	for r in rooms_layout:
		if r.tier == tier_tracker:
			master_ref.get_child(tier_tracker).add_child(r)
			#get recently added child
			newest_child = master_ref.get_child(tier_tracker).get_child(master_ref.get_child(tier_tracker).get_child_count()-1)
			#connect button signal to parent function
			newest_child.pressed.connect(_on_room_pressed.bind(newest_child.world_data))
		else:
			tier_tracker += 1
			master_ref.add_child(tier_scene.instantiate())
			master_ref.get_child(tier_tracker).add_child(r)
			#get recently added child
			newest_child = master_ref.get_child(tier_tracker).get_child(master_ref.get_child(tier_tracker).get_child_count()-1)
			#connect button signal to parent function
			newest_child.pressed.connect(_on_room_pressed.bind(newest_child.world_data))

func _on_room_pressed(rm: PackedScene):
	#do room map logic
	tier_tracker_buttons += 1
	for r in rooms_layout:
		if r.tier == tier_tracker_buttons:
			r.disabled = false
		else:
			r.disabled = true
	
	#change world scene and hide room map
	master_ref.visible = false
	world_ref.add_child(rm.instantiate())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		world_ref.get_child(0).queue_free()
		master_ref.visible = true
