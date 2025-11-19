extends Node2D

@onready var health_bar: TextureProgressBar = $Background_Image/Sub_Menus/HP_Bar/MarginContainer/Health_Prog
@onready var tween = get_tree().create_tween()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("health_changed", Callable(self, "update_health"))
	
	health_bar.max_value = PlayerData.stat_data["Max_hp"]
	health_bar.value = PlayerData.stat_data["Current_hp"]

func update_health():
	var newhp = PlayerData.stat_data["Current_hp"]
	print(str(newhp) + "  " + str(health_bar.value))
	tween.tween_property(health_bar, "value", newhp, 2.0)
