extends Button

#this generates new items and acts as a button on the reward screen

@onready var sprite_ref = $Sprite2D
@onready var label_ref = $Label
@onready var item

func _ready() -> void:
	#items should not be generated here, this prevents creating a blank item to move data into
	item = ItemGeneration()
	label_ref.text = item["item_rarity"] + " " + item["item_name"]
	sprite_ref.texture = load("res://zAssets/Items/%s_%s.png" %[item["item_name"],item["item_rarity"]])

func ItemGeneration():
	var new_item = {}
	new_item["item_id"] = ItemDetermineType()
	new_item["item_rarity"] = ItemDetermineRarity()
	new_item["item_name"] = ItemDetermineName(new_item["item_id"])
	for i in Reward.item_stats:
		if Reward.item_data[new_item["item_id"]][i] != null:
			new_item[i] = ItemDetermineStats(new_item["item_id"], new_item["item_rarity"], i)
	
	print(new_item)
	return new_item

func ItemDetermineType():
	var new_item_type
	var item_types = Reward.item_data.keys()
	randomize()
	new_item_type = item_types[randi() % item_types.size()]
	return new_item_type

func ItemDetermineRarity():
	var new_item_rarity
	var item_rarities = Reward.item_rarity_ditribution.keys()
	randomize()
	var rarity_roll = randi() % 100 +1
	for i in item_rarities:
		if rarity_roll <= Reward.item_rarity_ditribution[i]:
			new_item_rarity = i
			break
		else:
			rarity_roll -=Reward.item_rarity_ditribution[i]
	return new_item_rarity

func ItemDetermineStats(item_id, item_rarity, stat):
	var stat_value
	if Reward.item_scaling_stats.has(stat):
		stat_value = Reward.item_data[item_id][stat] * Reward.item_data[item_id][item_rarity + "Multi"]
	else:
		stat_value = Reward.item_data[item_id][stat]
	return stat_value

func ItemDetermineName(item_id):
	var item_name
	item_name = str(Reward.item_data[item_id]["name"])
	return item_name

func _on_pressed() -> void:
	InventoryUi.add_item_to_ui(item)
	queue_free()
