extends CanvasLayer

func update_score_labels() -> void:
	%CurrentScoreLabel.text = "Currest Score: %04d" % Global.last_score
	%HighestScoreLabel.text = "Highest Score: %04d" % Global.highest_score

func restart_game() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

func _ready() -> void:
	%HurtAudioStream.pitch_scale = randf_range(0.9, 1.1)
	%HurtAudioStream.play()
	update_score_labels()
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		restart_game()

func _on_restart_button_pressed() -> void:
	restart_game()
