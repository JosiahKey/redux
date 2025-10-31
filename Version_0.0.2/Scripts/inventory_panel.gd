extends NinePatchRect

var InvSize = 24
@onready var Grid_ref := $Inventory_Grid
@export var itemsLoad: Array[Resource] = []

func _ready() -> void:
	SignalBus.connect("item_collected", Callable(self, "_add_item_to_inventory"))
	
	for i in InvSize:
		var slot := InventorySlotOld.new()
		slot.init(ItemDataOld.Type.GENERAL, Vector2(32,32))
		Grid_ref.add_child(slot)
		
	for j in itemsLoad.size():
		var item := InventoryItemOld.new()
		item.init(itemsLoad[j])
		Grid_ref.get_child(j).add_child(item)

func _add_item_to_inventory(new_item: Resource):
	for i in InvSize:
		if Grid_ref.get_child(i).get_child_count() == 0:
			var item := InventoryItemOld.new()
			item.init(new_item)
			Grid_ref.get_child(i).add_child(item)
			break
