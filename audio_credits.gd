extends CanvasLayer

func _ready() -> void:
	%AnimationPlayer.play("NowPlaying")
	
func _on_timer_timeout() -> void:
	queue_free()
