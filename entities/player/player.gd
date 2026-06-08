extends CharacterBody2D
var speed := 600.0
var health := 100.0
@export var projectile_scene_1: PackedScene
### NOTES ###

func _ready() -> void:
#	set_health(health)
	pass
func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	 # Prevents increased movement when diagonally moving
	if direction.length() > 1.0:
		direction = direction.normalized()
	velocity = speed * direction
	move_and_slide()
	if Input.is_action_just_pressed("mouse_1"):
		_shoot()
	
	# OLD movement!
	# velocity = direction * max_speed
	#var desired_velocity := direction * max_speed
	#var steering_vector:= desired_velocity - velocity
	## Adds a fraction of the steering to the velocity
	#velocity += steering_vector * steering_factor * delta
	#position += velocity * delta

#func set_health(amount: float):
#	$UI/HealthBar.value = amount
	
func _shoot() -> void:
	var projectile = projectile_scene_1.instantiate()
	get_tree().current_scene.add_child(projectile)
	projectile.global_transform = global_transform
	
func _xp_collect(amount: float) -> void:
	pass

func _take_damage_(amount: float) -> void:
	pass
	# Game Manager will handle immunity frames	
