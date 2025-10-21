extends Node

#this code just needs to be a resource instead
#

@onready var health_globe = $HealthGlobe/GlobeFull/TextureProgressBar
@onready var health_text = $HealthText
@onready var health_globe_tween = get_tree().create_tween()

func _ready():
	health_globe.max_value = stats["hp_max"]
	health_globe.value = stats["hp"]
	health_text.text = str(stats["hp_max"])

func _process(_delta):
	health_globe.value = stats["hp"]
	health_text.text = str(stats["hp"])

var stats = {
	"hp_max": 500,
	"hp": 500,
	"strength": 5,
	"speed": 10,
}

func get_stat(stat: String):
	for x in stats:
		if x == stat:
			return stats[x]

func update_stats(hp_max, hp, str, spd):
	stats["hp_max"] += hp_max
	if stats["hp"] + hp > stats["hp_max"]:
		stats["hp"] = stats["hp_max"]
	else:
		stats["hp"] += hp
	stats["strength"] += str
	stats["speed"] += spd

func Update_Globes():
	var new_hp = stats["hp"] -200
	health_globe_tween.tween_property(health_globe, "value", new_hp, 0.1)
	health_globe_tween.stop()
