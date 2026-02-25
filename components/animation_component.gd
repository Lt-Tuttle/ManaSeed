class_name AnimationComponent
extends Node
# Animation component for handling player animations.

var parent: Node
var anim_tree: AnimationTree
var anim_player: AnimationPlayer
var last_direction: Vector2

func _ready() -> void:
	if parent:
		anim_player = parent.anim_player
		anim_tree = parent.anim_tree
		anim_tree.active = true

func animate(direction: Vector2) -> void:
	if not parent:
		return

	if direction != Vector2.ZERO:
		last_direction = direction
		anim_tree.set("parameters/Walk/blend_position", last_direction)
	else:
		anim_tree.set("parameters/Idle/blend_position", last_direction)