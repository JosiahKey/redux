extends Area2D

func _on_next_level_entered(body):
	if body.is_in_group("Player"):
		print("_on_nextlevel_entered()")
		SignalBus.load_area_entered.emit()
