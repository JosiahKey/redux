extends Node2D

@onready var enemy_scene = preload("res://Scenes/enemy.tscn")
@onready var pos = $"."

func _ready() -> void:
	var enemy = enemy_scene.instantiate()
	pos.add_child(enemy)
	enemy.position = Vector2(0,0)
