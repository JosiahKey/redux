extends NinePatchRect

@onready var  max_hp_label = $Stat_Grid/Health_Points_Stat_Label/stat_num
@onready var  strength_label = $Stat_Grid/Strength_Stat_Label/stat_num
@onready var  dex_label = $Stat_Grid/Speed_Stat_Label/stat_num
@onready var  vit_label = $Stat_Grid/Vitality_Stat_Label/stat_num
@onready var  body_label = $Stat_Grid/Body_Stat_Label/stat_num
@onready var  spr_label = $Stat_Grid/Spirit_Stat_Label/stat_num
@onready var  dmg_label = $Stat_Grid/Damage_Stat_Label/stat_num
@onready var  weight_label = $Stat_Grid/Weight_Stat_Label/stat_num

func _ready() -> void:
	SignalBus.connect("equipment_updated", Callable(self, "_update_stat_panel"))
	_update_stat_panel()

func _update_stat_panel():
	strength_label.text = str(PlayerData.stat_data["Strength"])
	dex_label.text = str(PlayerData.stat_data["Dexterity"])
	vit_label.text = str(PlayerData.stat_data["Vitality"])
	body_label.text = str(PlayerData.stat_data["Body"])
	spr_label.text = str(PlayerData.stat_data["Spirit"])
	max_hp_label.text = str(PlayerData.stat_data["Max_hp"])
	dmg_label.text = str(PlayerData.stat_data["Total_equipped_damage_min"]) + " - " + str(
						PlayerData.stat_data["Total_equipped_damage_max"])
	weight_label.text = str(PlayerData.stat_data["Total_equipped_weight"])
