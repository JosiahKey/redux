extends Node2D

var level_counter: int = 0
var level_max: int = 0
@onready var Level_List: Array[PackedScene] = [
	preload("res://Version_0.0.1/Scenes/Levels/Level0.tscn"),
	preload("res://Version_0.0.1/Scenes/Levels/Level1.tscn"),
	preload("res://Version_0.0.1/Scenes/Levels/Level2.tscn"),
	preload("res://Version_0.0.1/Scenes/Levels/Level3.tscn"),
	preload("res://Version_0.0.1/Scenes/Levels/Level4.tscn")
]


func _ready() -> void:
	SignalBus.connect("load_area_entered", Callable(self, "_on_next_level_load_area_entered"))
	
	level_max = Level_List.size() 
	self.add_child(Level_List[level_counter].instantiate())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if self.get_child_count() > 1:
			self.get_child(1).queue_free()
		level_counter += 1
		self.add_child(Level_List[level_counter % level_max].instantiate())

func _on_next_level_load_area_entered() -> void:
	if get_child_count() > 1:
		get_child(1).queue_free()
	level_counter += 1
	call_deferred("add_child", Level_List[level_counter % level_max].instantiate())
	print("signal passed")
