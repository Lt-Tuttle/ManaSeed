class_name InputComponent
extends Node
# Input component for handling player input.

@export var parent: Node

var direction: Vector2

func get_input() -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")


