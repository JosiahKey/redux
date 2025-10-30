extends NinePatchRect

var InvSize = 24
@onready var Grid_ref := $Inventory_Grid
@export var itemsLoad: Array[Resource] = []

func _ready() -> void:
	for i in InvSize:
		var slot := InventorySlot.new()
		slot.init(ItemData.Type.GENERAL, Vector2(32,32))
		Grid_ref.add_child(slot)
		
	for j in itemsLoad.size():
		var item := InventoryItem.new()
		item.init(itemsLoad[j])
		Grid_ref.get_child(j).add_child(item)

func add_item_to_inventory(new_item: Resource):
	for i in InvSize:
		if Grid_ref.get_child(i).get_child_count() == 0:
			var item := InventoryItem.new()
			item.init(new_item)
			Grid_ref.get_child(i).add_child(item)
			break

#these are debugging functions and should be removed
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		if !itemsLoad.is_empty():
			add_item_to_inventory(itemsLoad[0])
