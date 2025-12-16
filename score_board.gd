extends Control

func update_score(score : int) -> void:
	%ScoreLabel.text = "%04d" % score
