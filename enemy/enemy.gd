extends Node2D
class_name Enemy

@onready var area_2d: Area2D = $Area2D

@export var health_amount: int = 10
@export var light_essence: int = 1
@export var speed: float = 1.0


func _process(delta: float) -> void:
	position.y += speed


func take_damage(carrot: Carrot, amount: int) -> void:
	var t = create_tween()
	t.tween_property($Sprite2D, "self_modulate", Color.RED, 0.1)
	t.chain().tween_property($Sprite2D, "self_modulate", Color.BLACK, 0.1)

	health_amount -= amount
	if health_amount <= 0:
		carrot.remove_enemy_from_list(get_instance_id())
		queue_free()
		# give the player light essence
