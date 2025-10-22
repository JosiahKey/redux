class_name InventorySlot
extends PanelContainer

@export var type: ItemData.Type

func init(t: ItemData.Type, cms: Vector2) -> void:
	type = t
	custom_minimum_size = cms

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if data is InventoryItem:
		if type == ItemData.Type.GENERAL: #if the slot type is 'general', then drop anything if its empty
			if get_child_count() == 0:
				print(str(type))
				return true
			else: if type == data.get_parent().type:
				return true
			return get_child(0).data.type == data.data.type
		else:
			return data.data.type == type #return true if type of item and slot are the same
	return false

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if get_child_count() > 0:
		var item := get_child(0)
		if item == data:
			return
		item.reparent(data.get_parent())
	data.reparent(self)
