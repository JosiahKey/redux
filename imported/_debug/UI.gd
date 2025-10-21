extends CanvasLayer

# This code is to the top most layer of UI
# it always runs even when paused
# Currently it is only for debugging
#

@onready var label_ref = $debug_stats
@onready var label2_ref = $debug_stats2
var action_text = "this is a place"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_ref.add_theme_color_override("font_color", Color.BLACK)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label_ref.text = str(Statbloc.stats)

func _on_button_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_button_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")


func _on_button_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level3.tscn")
