shader_type spatial;
render_mode unshaded, depth_draw_never;

uniform sampler2D grad;
uniform float cycle_interval : hint_range(0.5, 5.0) = 5.0;
uniform float shine_speed : hint_range(1.0, 5.0) = 1.0;
uniform float shine_width : hint_range(1.0, 100.0) = 45.0;

void fragment( )
{
	vec3 world_vertex = (INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	vec3 local_vertex = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;


	float width = shine_width * 0.001 * cycle_interval;

	vec3 world_vector = (world_vertex);

	vec3 local_to_world = (inverse(MODEL_MATRIX) * vec4(world_vector, 1.0)).xyz;

	float frequency = sin((local_to_world.z) * cycle_interval + TIME * shine_speed * cycle_interval) * 8.0 + width;

	float binormal_sum = BINORMAL.y + BINORMAL.z + BINORMAL.x;
	float grad_uv_x = width + ( 1.5 + (binormal_sum)/1.5) + TIME/10.0;

	ALBEDO = texture(grad, vec2(grad_uv_x, 0)).rgb;
	ALPHA = clamp( ( 1.0 - dot( NORMAL, VIEW ) ) * frequency/8.0, 0.0, 1.0);
}
