extends NinePatchRect

var template_inv_slot = preload("res://Version_0.0.2/Scenes/Templates/inventory_slot.tscn")
@onready var grid_ref := $GridContainer

func _ready() -> void:
	for i in PlayerData.equipment_data.keys():
		var equip_slot_new = template_inv_slot.instantiate()
		if PlayerData.equipment_data[i] != null:
			var item_name  = GameData.item_data[str(int(PlayerData.equipment_data[i]))]["name"]
			var icon_texture =  load("res://Version_0.0.2/Assets/item_assets/"+ item_name +".png")
			equip_slot_new.get_node("Icon").set_texture(icon_texture)
			equip_slot_new.get_node("Icon").custom_init(GameData.item_data[
				str(int(PlayerData.equipment_data[i]))]["equipmentSlot"])
			print(equip_slot_new.get_node("Icon").type)
		grid_ref.add_child(equip_slot_new, true)

#func get_equipped_items() -> Array[Variant]:
	#var equipped_item_list: Array[Variant]
	#for g in grid_ref.get_children():
		#if g.get_child_count() > 0:
			#equipped_item_list.append(g.get_child(0).data)
	#print(equipped_item_list)
	#return equipped_item_list
	
