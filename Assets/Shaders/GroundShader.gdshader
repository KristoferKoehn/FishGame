shader_type spatial;

uniform vec3 GrassColor : source_color;
uniform vec3 PathColor : source_color;
uniform float PathGrassCutoff;
uniform float Roughness;

float dotProduct(vec3 v1, vec3 v2) {
    float result = (v1.x * v2.x) + (v1.y * v2.y) + (v1.z * v2.z);
    return result;
}

void vertex() {

}

void fragment() {

	ROUGHNESS = Roughness;

	float fragNormalProduct = dotProduct(vec3(0.0,1.0,0.0), (INV_VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz);
	if (abs(fragNormalProduct) > PathGrassCutoff) {
		ALBEDO = GrassColor;
	} else {
		ALBEDO = PathColor;
	}





}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
