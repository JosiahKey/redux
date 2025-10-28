extends Area2D

signal load_area_entered

func _on_next_level_entered(body):
	if body.is_in_group("Player"):
		print("_on_nextlevel_entered()")
		load_area_entered.emit()
