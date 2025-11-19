extends Control

@onready var sprite := $Enemy_Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass#SignalBus.hit_player.emit(20)

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("ui_accept"):
		#SignalBus.hit_player.emit(20)
