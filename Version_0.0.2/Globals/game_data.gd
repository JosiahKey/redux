extends Node

var item_data = {}

func _ready() -> void:
	var item_data_file = FileAccess.open("res://Version_0.0.2/Data/item_data.json", FileAccess.READ)
	var item_data_json = JSON.parse_string(item_data_file.get_as_text())
	item_data_file.close()
	item_data = item_data_json
	print(item_data)
