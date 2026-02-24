class_name MovementComponent
extends Node

@export var parent: Node

var velocity: Vector2
var max_speed: float = 10.0
var acceleration: float = 10.0
var deceleration: float = 10.0

func move(delta: float) -> void:
	var direction = parent.get_input()
	if direction.length() > 0:
		velocity = direction * max_speed
	else:
		velocity = velocity.lerp(Vector2.ZERO, deceleration * delta)

	parent.position += velocity * delta
