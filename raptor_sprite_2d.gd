extends AnimatedSprite2D

signal on_animation_end(anim_name : String)

func play_run() -> void:
	play("run")

func play_jump_loop() -> void:
	play("jump_loop")
	
func play_start_jump() -> void:
	play("jump_begin")

func play_end_jump() -> void:
	play("jump_end")

func _on_animation_finished() -> void:
	on_animation_end.emit(self.animation.get_basename())
