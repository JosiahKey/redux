extends Node

var inv_data = {}

var stat_data = {
	"Strength": 1,
	"Dexterity": 1,
	"Vitality": 1,
	"Body": 1,
	"Spirit": 1,
	"Max_hp": 10,
	"Current_hp": 10,
	"Total_equipped_damage_min": 0,
	"Total_equipped_damage_max": 0,
	"Highest_equipped_min_strength": 0,
	"Total_equipped_weight": 0
}

var equipment_data = {
	"Head": 10001,
	"Neck": null,
	"Shoulders": null,
	"Chest": null,
	"Mainhand": null,
	"Offhand": null,
	"Ring1": 10007,
	"Ring2": null,
	"Waist": null,
	"Legs": null,
	"Feet": null,
}

func _ready() -> void:
	_load_inv_data()

func _load_inv_data():
	var inv_data_file = FileAccess.open("user://inv_data.json", FileAccess.READ)
	var inv_data_json = JSON.parse_string(inv_data_file.get_as_text())
	inv_data_file.close()
	inv_data = inv_data_json

func _save_inv_data():
	var inv_data_file = FileAccess.open("user://inv_data.json", FileAccess.READ)
	var inv_data_json = JSON.stringify(inv_data)
	inv_data_file.store_string(inv_data_json)
	inv_data_file.close()
