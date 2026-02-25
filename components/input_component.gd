class_name InputComponent
extends Node
# Input component for handling player input.

var parent: Node

var direction: Vector2
var left_is_pressed: bool
var right_is_pressed: bool
var up_is_pressed: bool
var down_is_pressed: bool
var left_is_just_pressed: bool
var right_is_just_pressed: bool
var up_is_just_pressed: bool
var down_is_just_pressed: bool

func _ready() -> void:
	if parent == null:
		parent = get_parent()

func input() -> void:
	# General button states
	left_is_pressed = Input.is_action_pressed("move_left")
	right_is_pressed = Input.is_action_pressed("move_right")
	up_is_pressed = Input.is_action_pressed("move_up")
	down_is_pressed = Input.is_action_pressed("move_down")
	left_is_just_pressed = Input.is_action_just_pressed("move_left")
	right_is_just_pressed = Input.is_action_just_pressed("move_right")
	up_is_just_pressed = Input.is_action_just_pressed("move_up")
	down_is_just_pressed = Input.is_action_just_pressed("move_down")

	# Assign most recently pressed direction
	var new_dir := Vector2.ZERO
	if left_is_just_pressed:
		new_dir = Vector2.LEFT
	elif right_is_just_pressed:
		new_dir = Vector2.RIGHT
	elif up_is_just_pressed:
		new_dir = Vector2.UP
	elif down_is_just_pressed:
		new_dir = Vector2.DOWN

	# If a new direction was pressed, set it
	if new_dir != Vector2.ZERO:
		direction = new_dir
	elif direction != Vector2.ZERO:
		var current_held := false
		if direction == Vector2.LEFT and left_is_pressed:
			current_held = true
		elif direction == Vector2.RIGHT and right_is_pressed:
			current_held = true
		elif direction == Vector2.UP and up_is_pressed:
			current_held = true
		elif direction == Vector2.DOWN and down_is_pressed:
			current_held = true

		# If the current direction is no longer held, find the next direction
		if not current_held:
			if left_is_pressed:
				direction = Vector2.LEFT
			elif right_is_pressed:
				direction = Vector2.RIGHT
			elif up_is_pressed:
				direction = Vector2.UP
			elif down_is_pressed:
				direction = Vector2.DOWN
			else:
				direction = Vector2.ZERO