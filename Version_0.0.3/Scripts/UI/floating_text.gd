extends Marker2D


@onready var label := $Label
@onready var tween = get_tree().create_tween()
var amount = 0
var type: String = ""

var velocity = Vector2(0,0)

func _ready() -> void:
	label.text = str(amount)
	match type:
		"heal":
			label.add_theme_color_override("font_color", Color("2eff27"))
		"damage":
			label.add_theme_color_override("font_color", Color("ff3131"))
	
	randomize()
	var side_mov = randi() %81 -40
	velocity = Vector2(side_mov, 25)
	
	tween.tween_property(self,"scale", Vector2(1,1), 0.2)
	tween.tween_property(self,"scale", Vector2(0.1,0.1), 0.7)
	tween.tween_callback(self.queue_free)

func _process(delta: float) -> void:
	position -= velocity * delta
