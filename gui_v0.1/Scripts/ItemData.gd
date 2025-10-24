class_name ItemData
extends Resource

enum Type {HEAD, CHEST, ARM, WAIST, LEGS, GENERAL}

@export var is_equipped: bool
@export var type: Type
@export var name:String
@export var texture: Texture2D
@export var damage_min: int
@export var damage_max: int
@export var min_Strength: int
@export var weight: int
@export var commonMulti: float
@export var uncommonMulti: float
@export var rareMulti: float
@export var epicMulti: float
@export var legendaryMulti: float
