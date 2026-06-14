extends Node
signal health_changed(amount:float)
signal xp_changed(amount:float)
var player_health : float = 100
var player_max_health : float = 100
var xp : float = 0
var xp_upgrade : float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_changed.emit(player_health)
	xp_changed.emit(xp)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
