extends Area2D

@export var movement_speed : float = 10.0

var elapsed_time : float = 0.0
const LIFE_SPAN : float = 8.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%AnimatedSprite2D.play("fly")
	elapsed_time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position -= Vector2(movement_speed * delta, 0)
	elapsed_time += delta
	if elapsed_time > LIFE_SPAN:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
