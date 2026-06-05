extends CharacterBody2D

var speed := 600.0

func _ready() -> void:
	pass



func _process(delta: float) -> void:
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	 # Prevents increased movement when diagonally moving
	if direction.length() > 1.0:
		direction = direction.normalized()
	velocity = speed * direction
	move_and_slide()
	
	
		
	#if Input.is_action_just_pressed("boost"):
	#	max_speed = boost_speed
	#	get_node("Timer").start()
	
	# OLD movement!
	# velocity = direction * max_speed
	#var desired_velocity := direction * max_speed
	#var steering_vector:= desired_velocity - velocity
	## Adds a fraction of the steering to the velocity
	#velocity += steering_vector * steering_factor * delta
	#position += velocity * delta
	
	# Ensures direction is only changed when keys are being pressed
	#if velocity.length() > 0.0:
	#	rotation = velocity.angle()

#func _on_timer_timeout() -> void:
#	max_speed = normal_speed

func _take_damage(damage: float) -> void:
	# TAKE DAMAGE FROM ENEMIES
	# Damage taken will be the same from all enemies, for simplicity sake
	pass
