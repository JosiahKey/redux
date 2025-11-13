extends NinePatchRect

@onready var grid_ref := $GridContainer

func _ready() -> void:
	SignalBus.connect("item_equipped", Callable(self, "_update_equipped_stats"))
	_update_equipped_items()

func _update_equipped_items():
	for i in PlayerData.equipment_data.keys():
		if PlayerData.equipment_data[i] != null:
			var item_name:String  = GameData.item_data[str(int(PlayerData.equipment_data[i]))]["name"]
			var icon_texture:Texture =  load("res://Version_0.0.3/Assets/item_assets/"+ item_name +".png")
			print("TextureRect" +str(i)+ "/" + str(i) + "/Icon")
			grid_ref.get_node(str(i)+ "/" + str(i) + "/Icon").texture = icon_texture

func _update_equipped_stats():
	PlayerData.stat_data["Total_equipped_weight"] = 0
	PlayerData.stat_data["Total_equipped_damage_min"] = 0
	PlayerData.stat_data["Total_equipped_damage_max"] = 0
	PlayerData.stat_data["Highest_equipped_min_strength"] = 0

	for i in PlayerData.equipment_data.keys():
		if PlayerData.equipment_data[i] != null:
			PlayerData.stat_data["Total_equipped_weight"] += GameData.item_data[
									str(int(PlayerData.equipment_data[i]))]["weight"]
			PlayerData.stat_data["Total_equipped_damage_min"] += GameData.item_data[
									str(int(PlayerData.equipment_data[i]))]["damage_min"]
			PlayerData.stat_data["Total_equipped_damage_max"] += GameData.item_data[
									str(int(PlayerData.equipment_data[i]))]["damage_max"]
			#only keep highest min strength
			if PlayerData.stat_data["Highest_equipped_min_strength"] < GameData.item_data[
									str(int(PlayerData.equipment_data[i]))]["min_strength"]:
				PlayerData.stat_data["Highest_equipped_min_strength"] = GameData.item_data[
										str(int(PlayerData.equipment_data[i]))]["min_strength"]
	print(PlayerData.stat_data)
	SignalBus.equipment_updated.emit()
