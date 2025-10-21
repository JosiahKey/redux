extends NinePatchRect

@onready var health := $Stat_Grid/Health_Points_Stat_Label/stat_num
@onready var strength := $Stat_Grid/Strength_Stat_Label/stat_num
@onready var speed := $Stat_Grid/Speed_Stat_Label/stat_num

var stats = {
	"hp_max": 500,
	"hp": 500,
	"strength": 5,
	"speed": 10,
}

func _ready() -> void:
	update_stats(0,0,0,0)

func get_stat(stat: String):
	for x in stats:
		if x == stat:
			return stats[x]

func update_stats(hp_max, hp, stren, spd):
	stats["hp_max"] += hp_max
	if stats["hp"] + hp > stats["hp_max"]:
		stats["hp"] = stats["hp_max"]
	else:
		stats["hp"] += hp
	stats["strength"] += stren
	stats["speed"] += spd
	_update_stat_panel()

func _update_stat_panel():
	health.text = str(stats["hp_max"])
	strength.text = str(stats["strength"])
	speed.text = str(stats["speed"])
