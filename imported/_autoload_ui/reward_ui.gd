extends CanvasLayer

#this code should manage the reward screen
#gets passed reward info from enemy in order 
#to know what reward buttons to make

@onready var reward_list_ref = $Frame/reward_container
@onready var btn_scene = preload("res://Scenes/reward_item.tscn")
var enemy_num_rewards: int = 2

var item_data = {}
var item_stats = ["damage_min", "damage_max", "min_Strength", "weight"]
var item_scaling_stats = ["damage_min", "damage_max"]
var item_rarity_ditribution = {"common": 60,
	"uncommon": 27,
	"rare": 9,
	"epic": 3,
	"legendary": 1}

func _ready():
	var item_data_file = FileAccess.open("res://Data/Item_Table.json", FileAccess.READ)
	var item_data_json = JSON.parse_string(item_data_file.get_as_text())
	item_data_file.close()
	item_data = item_data_json

func _on_close_button_pressed() -> void:
	hide()
	get_tree().paused = false

func add_reward(num:int):
	for x in num:
		reward_list_ref.add_child(btn_scene.instantiate())

func _on_visibility_changed() -> void:
	if(Reward.visible):
		add_reward(enemy_num_rewards)
