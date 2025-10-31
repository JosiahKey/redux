class_name UIStats
extends NinePatchRect

var _stat_labels :Array[Label]

func _ready() -> void:
	_stat_labels.append(%Health_Points_Stat_Label/stat_num)
	_stat_labels.append(%Strength_Stat_Label/stat_num)
	_stat_labels.append(%Speed_Stat_Label/stat_num)
	_stat_labels.append(%Damage_Stat_Label/stat_num)


func get_stat_labels() -> Array[Label]:
	return _stat_labels

func set_stat_labels(values: Array[String]):
	values = values
