extends Node

var _health: Label
var _strength: Label
var _speed: Label
var _damage: Label

var stats = {
	"hp_max": 600,
	"hp": 500,
	"strength": 5,
	"speed": 10,
}

#Public 'Signal' functions. I think ideally this is just a node in the tree that uses signals instead
func set_stat_labels(h: Label, st: Label, sp: Label, d: Label):
	#this function is called by the stat panel when it is initialized
	_health = h
	_strength = st
	_speed = sp
	_damage = d
	#initialize stats to labels
	stats_changed(0,0,0,0)

func get_stat(stat: String):
	for x in stats:
		if x == stat:
			return stats[x]

func stats_changed(hp_max: int, hp: int, stren: int, spd: int):
	_update_stats(hp_max,hp,stren,spd)
	_update_stat_panel_labels()

#private functions
func _update_stats(hp_max: int, hp: int, stren: int, spd: int):
	stats["hp_max"] += hp_max
	if stats["hp"] + hp > stats["hp_max"]:
		stats["hp"] = stats["hp_max"]
	else:
		stats["hp"] += hp
	stats["strength"] += stren
	stats["speed"] += spd

func _update_stat_panel_labels():
	_health.text = str(stats["hp_max"])
	_strength.text = str(stats["strength"])
	_speed.text = str(stats["speed"])

func _calculate_damage() -> Vector2:
	
	return Vector2(0,0)
