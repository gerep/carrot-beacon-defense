extends Node2D
class_name Carrot

@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $DamageTimer

@export var damage_amount: int = 1

var current_enemies: Dictionary = {}


func _ready() -> void:
	area_2d.area_entered.connect(area_entered)
	area_2d.area_exited.connect(area_exited)

	timer.timeout.connect(damage_enemies)


func area_entered(area: Area2D) -> void:
	var enemy = area.owner
	current_enemies[enemy.get_instance_id()] = enemy


func area_exited(area: Area2D) -> void:
	current_enemies.erase(area.get_instance_id())


func damage_enemies() -> void:
	for enemy in current_enemies:
		if current_enemies[enemy]:
			current_enemies[enemy].take_damage(self, damage_amount)


func remove_enemy_from_list(enemy_instance_id: int) -> void:
	current_enemies.erase(enemy_instance_id)
