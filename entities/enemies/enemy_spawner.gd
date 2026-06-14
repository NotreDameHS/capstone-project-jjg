extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print("spawn!")
	var enemy_scene = preload("res://entities/enemies/zombie_1.tscn")
	var enemy_instance = enemy_scene.instantiate()
	add_child(enemy_instance)
	enemy_instance.add_to_group("enemy")

	var viewport_size = get_viewport_rect().size
	var spawn_position:= Vector2(0,0)
	spawn_position.x = randf_range(0, viewport_size.x)
	spawn_position.y = randf_range(0, viewport_size.y)
	
	enemy_instance.position = spawn_position
