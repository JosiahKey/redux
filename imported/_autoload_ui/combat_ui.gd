extends CanvasLayer

#
#code handles combat scene/ UI
# currently this just assumes the slime enemy. need to get passed that info from the enemy.tscn
#later on we should have skills be added dyncamically to account for level ups


var enemy_data = {}
var enemy_stats = ["hp","attack"]
var enemy_scaling_stats = ["hp","attack"]
var enemy_rarity_ditribution = {"common": 60,
	"uncommon": 27,
	"rare": 9,
	"epic": 3,
	"legendary": 1}

var rng = RandomNumberGenerator.new()
@onready var sprite_ref = $Frame/enemy_sprite
var enemy_inst

func _ready():
	var enemy_data_file = FileAccess.open("res://Data/Enemy_Table.json", FileAccess.READ)
	var enemy_data_json = JSON.parse_string(enemy_data_file.get_as_text())
	enemy_data_file.close()
	enemy_data = enemy_data_json

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	UI.label2_ref.text = str(enemy_inst)
	if enemy_inst["hp"] <= 0:
		_on_close_pressed()

func _on_close_pressed() -> void:
	hide()
	Reward.show()

func _on_atk_pressed() -> void:
	UI.action_text = "ATTACK"
	enemy_inst["hp"] -=  Statbloc.get_stat("strength") #add item damage to this
	Statbloc.update_stats(0,-1*(enemy_inst["attack"]),0,0)
