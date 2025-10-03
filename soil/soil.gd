extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var area_2d: Area2D = $Area2D
@onready var panel_container: PanelContainer = $PanelContainer


func _ready() -> void:
	sprite_2d.rotate(randf_range(-90, 90))
	area_2d.mouse_entered.connect(mouse_entered)
	area_2d.mouse_exited.connect(mouse_exited)


func mouse_entered() -> void:
	panel_container.visible = true


func mouse_exited() -> void:
	panel_container.visible = false
