extends CharacterBody2D

signal score_updated

@export_category("Movement Physics")
@export var SPEED : float = 300.0
@export var JUMP_VELOCITY : float = -400.0

enum State {
	RUNNING,
	JUMP_BEGIN,
	JUMP_LOOP,
	JUMP_END
}

var current_state : State = State.RUNNING
var is_jumping : bool = false
var is_recovering : bool = false

var score : float = 0.0
var int_score : int = 0

func _on_raptor_sprite_2d_on_animation_end(anim_name: String) -> void:
	match anim_name:
		"jump_begin":
			is_jumping = false
		"jump_end":
			is_recovering = false
			
func update_state() -> void:
	match current_state:
		State.RUNNING:
			%RaptorSprite2D.play_run()
			if Input.is_action_just_pressed("jump") and is_on_floor():
				%JumpAudioStream.pitch_scale = randf_range(0.9, 1.1)
				%JumpAudioStream.play()
				is_jumping = true
				current_state = State.JUMP_BEGIN
				%DustSprite2D.visible = false
				%RaptorSprite2D.play_start_jump()
				velocity.y = JUMP_VELOCITY
		State.JUMP_BEGIN:
			if !is_jumping:
				current_state = State.JUMP_LOOP
				%RaptorSprite2D.play_jump_loop()
		State.JUMP_LOOP:
			if is_on_floor():
				is_jumping = false
				is_recovering = true
				current_state = State.JUMP_END
				%RaptorSprite2D.play_end_jump()
		State.JUMP_END:
			if is_on_floor() and !is_recovering:
				current_state = State.RUNNING
				%RaptorSprite2D.play_run()
				%DustSprite2D.visible = true

func _ready() -> void:
	int_score = 0

func _physics_process(delta: float) -> void:
	update_state()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
	update_score(delta)

func take_damage() -> void:
	Global.update_score(int_score)
	get_tree().call_deferred("change_scene_to_file", "res://game_over.tscn")

func update_score(delta) -> void:
	score += delta
	if floor(score) > int_score:
		int_score = floor(score)
		score_updated.emit()
