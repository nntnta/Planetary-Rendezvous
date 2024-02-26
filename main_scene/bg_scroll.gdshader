shader_type canvas_item;
uniform float speedx = 0.02;
//uniform float speedy = 0.02;

void vertex() {
	UV.x += TIME * speedx;
	//UV.y += TIME * speedy;
}
