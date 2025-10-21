extends Area2D

#this code automatically loads a new level based on ordered numeric file names
#when they collide with an area

const FILE_BEGIN = "res://Levels/Level"

func _on_next_level_entered(body):
	if body.is_in_group("Player"):
		print("_on_nextlevel_entered()")
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		
		get_tree().change_scene_to_file(next_level_path)
