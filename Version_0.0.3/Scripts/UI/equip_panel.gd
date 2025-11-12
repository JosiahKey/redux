extends NinePatchRect

var template_inv_slot = preload("res://Version_0.0.2/Scenes/Templates/inventory_slot.tscn")
@onready var grid_ref := $GridContainer

func _ready() -> void:
	_update_equipped_items()

func _update_equipped_items():
	for i in PlayerData.equipment_data.keys():
		if PlayerData.equipment_data[i] != null:
			var item_name  = GameData.item_data[str(int(PlayerData.equipment_data[i]))]["name"]
			var icon_texture =  load("res://Version_0.0.2/Assets/item_assets/"+ item_name +".png")
			print("TextureRect" +str(i)+ "/" + str(i) + "/Icon")
			grid_ref.get_node(str(i)+ "/" + str(i) + "/Icon").texture = icon_texture
