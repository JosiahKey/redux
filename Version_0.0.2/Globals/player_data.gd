extends Node

var inv_data = {}

var equipment_data = {
	"Head": null,
	"Neck": null,
	"Shoulders": 10004,
	"Mainhand": 10005,
	"Offhand": null,
	"Ring1": null,
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
