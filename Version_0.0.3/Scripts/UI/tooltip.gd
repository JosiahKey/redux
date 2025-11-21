extends PopupPanel

var origin: String = ""
var slot: String = ""
var valid: bool = false

func _ready() -> void:
	@warning_ignore("unused_variable")
	var item_id: String
	if origin == "Inventory":
		if PlayerData.inv_data[slot]["Item"] != null:
			item_id = str(PlayerData.inv_data[slot]["Item"])
			valid = true
	else: #origin equipment
		if PlayerData.equipment_data[slot] != null:
			item_id = str(PlayerData.equipment_data[slot])
			valid = true
		
		if valid:
			pass
