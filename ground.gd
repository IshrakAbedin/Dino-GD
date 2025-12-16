extends StaticBody2D

@export_group("Timer Info")
@export var timer_initial_wait : float = 2.2
@export var timer_decrement : float = 0.00575
@export var timer_min : float = 1.1

@export_group("Movement Info")
@export var initial_speed_scale : float = 0.4
@export var speed_scale_gain : float = 0.002

var current_speed_scale : float = 0.4
var shader_param : ShaderMaterial
var time_elapsed : float = 0.0

func _ready() -> void:
	time_elapsed = 0.0
	current_speed_scale = initial_speed_scale
	shader_param = %GroundTexture.material as ShaderMaterial
	if !shader_param:
		push_error("Empty shader material for ground texture")
	assign_speed_scale(current_speed_scale)
	assign_speed_scale_gain(speed_scale_gain)
	assign_custom_time(time_elapsed)
	
func _process(delta: float) -> void:
	time_elapsed += delta
	assign_custom_time(time_elapsed)

func assign_speed_scale(speed_scale : float) -> void:
	shader_param.set_shader_parameter("speed_scale", speed_scale)

func assign_speed_scale_gain(gain : float) -> void:
	shader_param.set_shader_parameter("speed_scale_gain", gain)
	
func assign_custom_time(elapsed_time : float) -> void:
	shader_param.set_shader_parameter("ctime", elapsed_time)

func update_speed() -> void:
	if %Timer.wait_time > timer_min:
		%Timer.wait_time -= timer_decrement

func _on_timer_timeout() -> void:
	update_speed()
