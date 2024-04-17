shader_type spatial;
render_mode unshaded, depth_draw_never;

void vertex() {
	 COLOR = vec4(TANGENT, 1.0);
}



void fragment( )
{
	ALBEDO = COLOR.rgb;
	//ALBEDO = BINORMAL.rgb;
	//ALBEDO = NORMAL.rgb;
	//ALBEDO = TANGENT.rgb;
}
