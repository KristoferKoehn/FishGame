shader_type canvas_item;
uniform vec4 tint_color : source_color = vec4(1.0);
uniform float blur_scale: hint_range(0.0, 5.0) = 0.0;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear_mipmap;

void fragment() {

	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV, blur_scale);
	COLOR = mix(vec4(color.rgb, 1.0), tint_color, 0.5);
}