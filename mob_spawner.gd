extends Marker2D

const CACTUS = preload("res://cactus.tscn")
const FLYING_DINO = preload("res://flying_dino.tscn")

@export_category("Spawner")

@export_group("Spawn Zone")
@export var width : float = 600
@export var max_width : float = 1200
@export var width_increment : float = 2

@export_group("Mob Speed")
@export var initial_speed : float = 250
@export var speed_gain : float = 5
@export_subgroup("Bird")
@export var bird_height : float = 75.0
@export var bird_probabiliy : float = 0.1

@export_group("Spawn Rate")
@export var timer_initial_wait : float = 2.2
@export var timer_decrement : float = 0.00575
@export var timer_min : float = 1.1

var current_speed : float

func _ready() -> void:
	current_speed = initial_speed
	%Timer.wait_time = timer_initial_wait
	
func spawn_cactus(movement_speed = null) -> void:
	var cactus = CACTUS.instantiate()
	cactus.global_position = global_position + Vector2((randf() * width) - (width / 2), 0)
	if movement_speed:
		cactus.movement_speed = movement_speed
	add_child(cactus)
	
func spawn_bird(movement_speed = null) -> void:
	var bird = FLYING_DINO.instantiate()
	bird.global_position = global_position + Vector2((randf() * width) - (width / 2), -bird_height)
	if movement_speed:
		bird.movement_speed = movement_speed
	add_child(bird)
	
func update_speed() -> void:
	current_speed += speed_gain
	if %Timer.wait_time > timer_min:
		%Timer.wait_time -= timer_decrement
	if width < max_width:
		width += width_increment

func _on_timer_timeout() -> void:
	var prob : float = randf()
	if prob < bird_probabiliy:
		spawn_bird(current_speed)
	else:
		spawn_cactus(current_speed)
	
	update_speed()
