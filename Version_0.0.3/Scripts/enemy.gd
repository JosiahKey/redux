extends Control

@onready var sprite := $Enemy_Sprite
@onready var enemy_stats: Dictionary = {}
@onready var floating_text := preload("res://Version_0.0.3/Scenes/UI/floating_text.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_stats = {
		"Max_hp": 10,
		"Current_hp": 10,
		"Damage_min": 1,
		"Damage_max": 2,
		"Accuracy": .5,
		"Evasion": 0.0,
		"PDR": 0.0
	}

func on_hit(damage):
	var text = floating_text.instantiate()
	text.amount = damage
	text.type = "damage"
	sprite.add_child(text)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		on_hit(30)
		#SignalBus.hit_player.emit(20)
