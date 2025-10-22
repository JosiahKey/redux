class_name UIStats
extends NinePatchRect

func _ready() -> void:
	StatManager.set_stat_labels(
		%Health_Points_Stat_Label/stat_num,
		%Strength_Stat_Label/stat_num,
		%Speed_Stat_Label/stat_num,
		%Damage_Stat_Label/stat_num
	)

func get_stat_labels() -> Array[Label]:
	var result_array: Array[Label]
	result_array.append(%Health_Points_Stat_Label/stat_num)
	result_array.append(%Strength_Stat_Label/stat_num)
	result_array.append(%Speed_Stat_Label/stat_num)
	result_array.append(%Damage_Stat_Label/stat_num)
	return result_array

func set_stat_labels(values: Array[String]):
	pass
