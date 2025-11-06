extends NinePatchRect

var template_inv_slot = preload("res://Version_0.0.2/Scenes/Templates/inventory_slot.tscn")
@onready var grid_ref := $GridContainer

func _ready() -> void:
	_update_equipped_items()

func _update_equipped_items():
	for i in PlayerData.equipment_data.keys():
		var equip_slot_new = template_inv_slot.instantiate()
		if PlayerData.equipment_data[i] != null:
			var item_name  = GameData.item_data[str(int(PlayerData.equipment_data[i]))]["name"]
			var icon_texture =  load("res://Version_0.0.2/Assets/item_assets/"+ item_name +".png")
			equip_slot_new.get_node("Icon").set_texture(icon_texture)
			equip_slot_new.get_node("Icon").custom_init(
				GameData.item_data[str(int(PlayerData.equipment_data[i]))]["equipmentSlot"],
				i,
				str(PlayerData.equipment_data[i]))
			print(equip_slot_new.get_node("Icon").type)
		grid_ref.add_child(equip_slot_new, true)
