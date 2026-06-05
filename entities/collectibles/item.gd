extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_floating_animation()

func play_floating_animation() -> void:
	var tween := create_tween()
	var sprite2d := get_node("Sprite2D")
	var position_offset := Vector2(0, 4)
	var duration := randf_range(0.8, 1.2)
	
	tween.set_loops()
	tween.set_trans(tween.TRANS_SINE)
	tween.tween_property(sprite2d, "position", position_offset, duration)
	tween.tween_property(sprite2d, "position", -1 * position_offset, duration)

# Called every frame. 'delta': is the elapsed time since the previous frame.



func _on_area_entered(area: Area2D) -> void:
	print("Item area entered by:")# Prints to the debug console when playing
	print(area)  # This attribute will attach the object that made contact as the the arguement
	queue_free() # Tells the game to safely remove the object
	
func _xp_collect(amount: float) -> void:
	pass
