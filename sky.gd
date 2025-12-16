extends Node2D

func _ready() -> void:
	%AnimationPlayer.play("rotation")

func _process(_delta: float) -> void:
	%SunSprite2D.global_rotation = 0
	%MoonSprite2D.global_rotation = 0
