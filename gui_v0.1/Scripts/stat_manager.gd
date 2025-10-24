extends Node

@onready var stat_panel := $MenuRect/Stat_Panel
@onready var equip_panel := $MenuRect/Equip_Panel

var stats = {
	"hp_max": 600,
	"strength": 5,
	"speed": 10,
	"hp": 500,
}

func get_stat(stat: String):
	for x in stats:
		if x == stat:
			return stats[x]

#private functions
func _ready() -> void:
	_update_stat_panel_labels()

func _update_stat_panel_labels():
	var labels: Array[Label] = stat_panel.get_stat_labels()
	for l in labels.size():
		labels[l].text = str(stats.values()[l])
		
func _set_stats(hp_max: int, stren: int, spd: int, hp: int):
	stats["hp_max"] += hp_max
	if stats["hp"] + hp > stats["hp_max"]:
		stats["hp"] = stats["hp_max"]
	else:
		stats["hp"] += hp
	stats["strength"] += stren
	stats["speed"] += spd
	_update_stat_panel_labels()

func _calculate_damage() -> Vector2:
	
	return Vector2(0,0)

func _on_equip_slot_child_entered_tree(node: Node) -> void:
	_set_stats(0,0,node.data.damage_max,0)


func _on_equip_slot_child_exiting_tree(node: Node) -> void:
	_set_stats(0,0,-node.data.damage_max,0)
