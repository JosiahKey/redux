extends Control

var template_inv_slot = preload("res://Version_0.0.2/Scenes/Templates/inventory_slot.tscn")

@onready var grid_ref = $MarginContainer/Inventory_Grid

func _ready() -> void:
	for i in PlayerData.inv_data.keys():
		var inv_slot_new = template_inv_slot.instantiate()
		if PlayerData.inv_data[i]["Item"] != null:
			var item_name  = GameData.item_data[str(int(PlayerData.inv_data[i]["Item"]))]["name"]
			var icon_texture =  load("res://Version_0.0.2/Assets/item_assets/"+ item_name +".png")
			inv_slot_new.get_node("Icon").set_texture(icon_texture)
		grid_ref.add_child(inv_slot_new, true)
