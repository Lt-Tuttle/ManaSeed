class_name MovementComponent
extends Node
# Movement component for handling player movement.

var parent: Node

@export_category("Movement")
@export var max_speed: float = 160.0

func _ready() -> void:
	if parent == null:
		parent = get_parent()

func move(_delta: float, direction: Vector2) -> void:
	parent.velocity = direction * max_speed
	parent.move_and_slide()
