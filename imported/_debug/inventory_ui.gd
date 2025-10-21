extends Node

@onready var list_ref = $Item_List
var inventory = []

func _ready() -> void:
	pass

func add_item_to_ui(stuff):
	var new_label: Label = Label.new()
	new_label.text = str(stuff)
	new_label.add_theme_color_override("font_color", Color.BLACK)
	list_ref.add_child(new_label)
	var new_texture: Sprite2D = Sprite2D.new()
	new_texture.texture = load("res://zAssets/Items/%s_%s.png" %[stuff["item_name"],stuff["item_rarity"]])
	list_ref.add_child(new_texture)

#func add_item_to_inventory(HP_max, HP, atk, def, money):
	#var new_item_stats = [HP_max, HP, atk, def, money]
	#inventory.append(new_item_stats)
	#var new_label: Label = Label.new()
	#new_label.text = str(new_item_stats)
	#new_label.add_theme_color_override("font_color", Color.BLACK)
	#list_ref.add_child(new_label)


func _on_button_pressed() -> void:
	if(list_ref.visible):
		list_ref.hide()
	else:
		list_ref.show()
