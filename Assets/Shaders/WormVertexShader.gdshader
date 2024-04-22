shader_type spatial;

uniform vec4 color : source_color;

void vertex() {
	// Called for every vertex the material is visible on.
	VERTEX.z += sin(TIME * 1.2 + VERTEX.y) * 1.2;
}

void fragment() {
	ALBEDO = color.rgb;
	ALPHA = color.a;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
