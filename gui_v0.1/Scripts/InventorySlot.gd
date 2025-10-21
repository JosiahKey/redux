class_name InventorySlot2
extends PanelContainer

@export var type: ItemData2.Type

func init(t: ItemData2.Type, cms: Vector2) -> void:
	type = t
	custom_minimum_size = cms

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if data is InventoryItem2:
		if type == ItemData2.Type.MAIN:
			if get_child_count() == 0:
				return true
			else: if type == data.get_parent().type:
				return true
			return get_child(0).data.type == data.data.type
		else:
			return data.data.type == type
	return false

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if get_child_count() > 0:
		var item := get_child(0)
		if item == data:
			return
		item.reparent(data.get_parent())
	data.reparent(self)
