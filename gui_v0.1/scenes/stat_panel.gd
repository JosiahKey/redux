extends NinePatchRect

func _ready() -> void:
	StatManager.set_stat_labels(
		%Health_Points_Stat_Label/stat_num,
		%Strength_Stat_Label/stat_num,
		%Speed_Stat_Label/stat_num,
		%Damage_Stat_Label/stat_num
	)
