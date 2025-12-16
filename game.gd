extends Node2D


func _on_raptor_score_updated() -> void:
	%ScoreBoard.update_score(%Raptor.int_score)
