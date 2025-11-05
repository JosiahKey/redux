extends PanelContainer

enum Type {HEAD, NECK, SHOULDERS, MAINHAND, OFFHAND, RING1, RING2, WAIST, LEGS, FEET, GENERAL}
@export var type: Type

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if type == Type.GENERAL: #if the slot type is 'general', then drop anything if its empty
		if get_child_count() == 0:
			return true
		else: if type == data.get_parent().type:
			return true
		return get_child(0).type == data.type
	else:
		return data.type == type #return true if type of item and slot are the same

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if get_child_count() > 0:
		var item := get_child(0)
		if item == data:
			return
		item.reparent(data.get_parent())
	data.reparent(self)
