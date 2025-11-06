extends TextureRect

enum Type {HEAD, NECK, SHOULDERS, MAINHAND, OFFHAND, RING1, RING2, WAIST, LEGS, FEET, GENERAL}
@export var type: Type
var inv_id: String
var item_id: String

func custom_init(t: String, i: String, it: String) -> void:
	type = Type[t]
	inv_id = i
	item_id = it

func _get_drag_data(at_position: Vector2):
	set_drag_preview(make_drag_preview(at_position))
	return self
	
func make_drag_preview(at_position: Vector2):
	var t := TextureRect.new()
	t.name = "Icon"
	t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	t.texture = texture
	t.custom_minimum_size = size*1.3
	t.modulate.a = 0.5
	t.position = Vector2(-at_position)
	var c := Control.new()
	c.add_child(t)
	return c
