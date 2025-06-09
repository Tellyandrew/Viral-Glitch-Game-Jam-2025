varying vec2 v_vTexcoord;

uniform vec2 dimensions;
uniform float time;
uniform vec2 anchor;

void main()
{
    gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
	vec2 position = floor(dimensions * v_vTexcoord);
	float manhattan = abs(anchor.x - position.x) + abs(anchor.y - position.y);
	if (mod((manhattan - time), 4.0) < 2.0){
		discard;
	}
}