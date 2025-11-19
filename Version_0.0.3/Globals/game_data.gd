extends Node

var item_data = {}
var item_rarity_ditribution = {"common": 60,
	"uncommon": 27,
	"rare": 9,
	"epic": 3,
	"legendary": 1}
var item_stats = ["Damage_min", "Damage_max", "Accuracy", "Evasion", "Hp", "PDR", "Weight"]
var item_scaling_stats = ["Damage_min", "Damage_max", "Accuracy", "Evasion", "Hp", "PDR"]

func _ready() -> void:
	var item_data_file = FileAccess.open("res://Version_0.0.3/Data/item_data2.json", FileAccess.READ)
	var item_data_json = JSON.parse_string(item_data_file.get_as_text())
	item_data_file.close()
	item_data = item_data_json
