extends CharacterBody2D

@export_category("Components")
@export var movement_component: MovementComponent
@export var input_component: InputComponent
@export var animation_component: AnimationComponent

@export_category("Visuals")
@export var sprite: Sprite2D
@export var anim_tree: AnimationTree
@export var anim_player: AnimationPlayer

@export_category("Combat")
@export var hitbox: Area2D
@export var hitbox_shape: CollisionShape2D
@export var hurtbox: Area2D
@export var hurtbox_shape: CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the parent of each component to this node
	if movement_component:
		movement_component.parent = self
	if input_component:
		input_component.parent = self
	if animation_component:
		animation_component.parent = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if input_component:
		input_component.input()
	if movement_component:
		movement_component.move(delta, input_component.direction)
	if animation_component:
		animation_component.animate(input_component.direction)
