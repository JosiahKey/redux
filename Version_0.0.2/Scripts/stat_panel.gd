extends NinePatchRect

var _stat_labels :Array[Label]

func _ready() -> void:
	_stat_labels.append(%Health_Points_Stat_Label/stat_num)
	_stat_labels.append(%Strength_Stat_Label/stat_num)
	_stat_labels.append(%Speed_Stat_Label/stat_num)
	_stat_labels.append(%Damage_Stat_Label/stat_num)
	
	_update_stat_panel()


func _update_stat_panel():
	for i in PlayerData.equipment_data.keys():
		if PlayerData.equipment_data[i] != null:
			var item_damage = GameData.item_data[str(int(PlayerData.equipment_data[i]))]["damage_max"]
			var int_text = int(_stat_labels[3].text)
			_stat_labels[3].text = str(int_text + (int(item_damage)))
