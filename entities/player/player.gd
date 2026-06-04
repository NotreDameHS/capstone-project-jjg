extends Sprite2D

var normal_speed := 600.0
var boost_speed := 1200.0
var max_speed := normal_speed
var velocity := Vector2(480,-480)
var steering_factor := 20.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	# Prevents increased movement when diagonally moving
	if direction.length() > 1.0:
		direction = direction.normalized()
		
	if Input.is_action_just_pressed("boost"):
		max_speed = boost_speed
		get_node("Timer").start()
	
	# OLD movement!
	# velocity = direction * max_speed
	var desired_velocity := direction * max_speed
	var steering_vector:= desired_velocity - velocity
	# Adds a fraction of the steering to the velocity
	velocity += steering_vector * steering_factor * delta
	position += velocity * delta
	
	# Ensures direction is only changed when keys are being pressed
	if velocity.length() > 0.0:
		rotation = velocity.angle()

func _on_timer_timeout() -> void:
	max_speed = normal_speed

func _take_damage(damage: float) -> void:
	# TAKE DAMAGE FROM ENEMIES
	# Damage taken will be the same from all enemies, for simplicity sake
	pass
