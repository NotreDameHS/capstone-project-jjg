class_name Enemy extends CharacterBody2D
@export var health : float = 100.0
@export var speed : float = 200.0
@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")

### TO DO ###
# healthbar

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	if player == null:
		return
	else:
		look_at(player.global_position)
		var direction: Vector2 = global_position.direction_to(player.global_position)
		velocity = direction * speed
		position += velocity * delta

func _take_damage(amount: float) -> void:
	health -= amount
	if health <= 0:
		queue_free()
