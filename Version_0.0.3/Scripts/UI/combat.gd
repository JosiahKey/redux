extends Node2D

@onready var health_bar: TextureProgressBar = $Background_Image/Sub_Menus/HP_Bar/MarginContainer/Health_Prog
@onready var player_spr: AnimatedSprite2D = $Background_Image/Player/Player_Sprite
@onready var player_turn_ind :GPUParticles2D = $Background_Image/Player/Player_Turn_Indicator
var players_turn: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("health_changed", Callable(self, "update_health"))
	
	health_bar.max_value = PlayerData.stat_data["Total_hp"]
	health_bar.value = PlayerData.stat_data["Current_hp"]

func _process(_delta: float) -> void:
	if players_turn:
		player_turn_ind.visible = true
	else:
		player_turn_ind.visible = false

func update_health():
	var tween = get_tree().create_tween()
	var newhp = PlayerData.stat_data["Current_hp"]
	print(str(newhp) + "  " + str(health_bar.value))
	tween.tween_property(health_bar, "value", newhp, 2.0)

func player_attack_action():
	if players_turn:
		player_spr.play("attack")


func _on_texture_button_pressed() -> void:
	player_attack_action()
	players_turn = false
