extends Area2D

#This code should import an enemy resource and pass its info to 
# combat and reward UI as well as start combat on collision
#

@onready var sprite_ref = $Sprite2D
@onready var enemy

func _ready() -> void:
	enemy = EnemyGeneration()
	sprite_ref.texture = load("res://zAssets/Guys/%s.png" % enemy["enemy_name"])

func EnemyGeneration():
	var new_enemy = {}
	new_enemy["enemy_id"] = EnemyDetermineType()
	new_enemy["enemy_rarity"] = EnemyDetermineRarity()
	new_enemy["enemy_name"] = EnemyDetermineName(new_enemy["enemy_id"])
	for i in Combat.enemy_stats:
		if Combat.enemy_data[new_enemy["enemy_id"]][i] != null:
			new_enemy[i] = EnemyDetermineStats(new_enemy["enemy_id"], new_enemy["enemy_rarity"], i)
	
	print(new_enemy)
	return new_enemy

func EnemyDetermineType():
	var new_enemy_type
	var enemy_types = Combat.enemy_data.keys()
	randomize()
	new_enemy_type = enemy_types[randi() % enemy_types.size()]
	return new_enemy_type

func EnemyDetermineRarity():
	var new_enemy_rarity
	var enemy_rarities = Combat.enemy_rarity_ditribution.keys()
	randomize()
	var rarity_roll = randi() % 100 +1
	for i in enemy_rarities:
		if rarity_roll <= Combat.enemy_rarity_ditribution[i]:
			new_enemy_rarity = i
			break
		else:
			rarity_roll -=Combat.enemy_rarity_ditribution[i]
	return new_enemy_rarity

func EnemyDetermineStats(enemy_id, enemy_rarity, stat):
	var stat_value
	if Combat.enemy_scaling_stats.has(stat):
		stat_value = int(Combat.enemy_data[enemy_id][stat] * Combat.enemy_data[enemy_id][enemy_rarity + "Multi"])
	else:
		stat_value = int(Combat.enemy_data[enemy_id][stat])
	return stat_value

func EnemyDetermineName(enemy_id):
	var enemy_name
	enemy_name = str(Combat.enemy_data[enemy_id]["name"])
	return enemy_name

func _on_enemy_entered(body):
	if body.is_in_group("Player"):
		Combat.enemy_inst = enemy
		Combat.sprite_ref.texture = load("res://zAssets/Guys/%s.png" % enemy["enemy_name"])
		get_tree().paused = true
		Combat.show()
		queue_free()
