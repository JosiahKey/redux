extends Node2D

@onready var Level_List: Array[PackedScene] = [
	preload("res://elonsmaps_nextlevel/Level0.tscn"),
	preload("res://elonsmaps_nextlevel/Level1.tscn"),
	preload("res://elonsmaps_nextlevel/Level2.tscn"),
	preload("res://elonsmaps_nextlevel/Level3.tscn"),
	preload("res://elonsmaps_nextlevel/level_1.tscn")
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if self.get_child_count() != 0:
			self.get_child(0).queue_free()
		self.add_child(Level_List[3].instantiate())

func _on_next_level_load_area_entered() -> void:
	print("signal passed")
