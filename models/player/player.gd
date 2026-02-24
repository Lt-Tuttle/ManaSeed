extends CharacterBody2D

@export var movement_component: MovementComponent
@export var input_component: InputComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if movement_component:
		movement_component.parent = self
	if input_component:
		input_component.parent = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if input_component:
		input_component.get_input()
	if movement_component:
		movement_component.move(_delta)
