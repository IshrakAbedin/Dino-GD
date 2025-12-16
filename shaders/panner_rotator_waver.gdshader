shader_type canvas_item;

group_uniforms user_time;
uniform float ctime = 0.0;

group_uniforms panner;
uniform bool pan = false;
uniform vec2 direction = vec2(1.0f, 0.0f);
uniform float speed_scale = 0.1;
uniform float speed_scale_gain = 0.01;

group_uniforms rotator;
uniform bool rotate = false;
uniform bool clockwise = false;
uniform vec2 origin = vec2(0.5, 0.5);
uniform float rotation_rate = 1.57075;

group_uniforms waver;
uniform bool wave = false;
uniform vec2 wave_amount = vec2(0.1, 0.0);
uniform float wave_speed = 0.5;

vec2 translate2D(vec2 in_vector, vec2 displacement) {
	return in_vector + displacement;
}

vec2 rotate2D(vec2 in_vector, float angle) {
	return mat2(vec2(cos(angle), -sin(angle)), vec2(sin(angle), cos(angle))) * in_vector;
}

void fragment() {	
	vec2 uv = UV;
	
	if(rotate) {
		float mult = clockwise ? -1.0 : 1.0;
		uv = translate2D(uv, -origin);
		uv = rotate2D(uv, TIME * rotation_rate * mult);
		uv = translate2D(uv, origin);
	}
	
	if(pan) {
		float sscale = speed_scale + ctime * speed_scale_gain;
		uv = translate2D(uv, ctime * direction * sscale);
	}
	
	if(wave) {
		uv += wave_amount * sin(TIME * wave_speed);
	}
	
	COLOR = texture(TEXTURE, uv);
}
