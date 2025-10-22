extends Node

#test
var health: Label
var strength: Label
var speed: Label
var damage: Label

var stats = {
	"hp_max": 400,
	"hp": 500,
	"strength": 5,
	"speed": 10,
}

func set_stat_labels(h: Label, st: Label, sp: Label, d: Label):
	health = h
	strength = st
	speed = sp
	damage = d
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

func _calculate_damage() -> Vector2:
	
	return Vector2(0,0)
