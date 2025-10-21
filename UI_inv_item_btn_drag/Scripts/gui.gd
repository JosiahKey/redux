extends CanvasLayer

var InvSize = 24
@export var itemsLoad: Array[Resource] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in InvSize:
		var slot := InventorySlotTest.new()
		slot.init(ItemDataTest.Type.GENERAL, Vector2(32,32))
		%MenuGrid.add_child(slot)
		
	for j in itemsLoad.size():
		var item := InventoryItemTest.new()
		item.init(itemsLoad[j])
		%MenuGrid.get_child(j).add_child(item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		self.visible = !self.visible


func _on_menu_close_pressed() -> void:
	self.visible = !self.visible
