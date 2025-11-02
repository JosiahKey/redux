extends Node

var inv_data = {}

var equipment_data = {
	"Head": null,
	"Neck": null,
	"Shlouders": 10004,
	"Mainhand": 10005,
	"Offhand": null,
	"Ring1": null,
	"Ring2": null,
	"Waist": null,
	"Legs": null,
	"Feet": null,
}

func _ready() -> void:
	var inv_data_file = FileAccess.open("user://inv_data.json", FileAccess.READ)
	var inv_data_json = JSON.parse_string(inv_data_file.get_as_text())
	inv_data_file.close()
	inv_data = inv_data_json
