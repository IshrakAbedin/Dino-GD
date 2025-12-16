extends Node

var highest_score : int = 0
var last_score : int = 0

const SCORE_FILE: String = "user://dino_score.save"

func _ready() -> void:
	load_score()

func update_score(score : int) -> void:
	last_score = score
	if last_score > highest_score:
		highest_score = last_score
		save_score()

func save_score() -> void:
	var file = FileAccess.open(SCORE_FILE, FileAccess.ModeFlags.WRITE)
	if file:
		file.store_line(str(highest_score))
		file.close()
	else:
		print("Failed to save score!")

func load_score() -> void:
	var file = FileAccess.open(SCORE_FILE, FileAccess.ModeFlags.READ)
	if file:
		if file.get_length() > 0:
			highest_score = file.get_line().to_int()
		file.close()
	else:
		print("No save file found. Starting with default highest score.")
