extends Node

var stat_ui_ref: NinePatchRect

var stats = {
	"hp_max": 600,
	"strength": 5,
	"speed": 10,
	"hp": 500,
}

func _ready() -> void:
	#this is creating a race condition because the auto load is loaded before the stat panel exists
	#to fix this the stat panel will have to initiate the update to stats on ready()
	_update_stat_panel_labels(stat_ui_ref.get_stat_labels())
	
func _process(delta: float) -> void:
	pass
	

func _update_stat_panel_labels(labels: Array[Label]):
	for l in labels.size():
		labels[l].text = str(stats[l])

func get_stat(stat: String):
	for x in stats:
		if x == stat:
			return stats[x]

func stats_changed(hp_max: int, hp: int, stren: int, spd: int):
	#_set_stats(hp_max,hp,stren,spd)
	#_update_stat_panel_labels()
	pass

#private functions
func _set_stats(hp_max: int, hp: int, stren: int, spd: int):
	stats["hp_max"] += hp_max
	if stats["hp"] + hp > stats["hp_max"]:
		stats["hp"] = stats["hp_max"]
	else:
		stats["hp"] += hp
	stats["strength"] += stren
	stats["speed"] += spd

func _calculate_damage() -> Vector2:
	
	return Vector2(0,0)
