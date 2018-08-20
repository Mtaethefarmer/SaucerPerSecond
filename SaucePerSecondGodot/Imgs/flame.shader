shader_type canvas_item;

uniform float time_factor = 4.5;
uniform float amplitude = 1.0;
uniform float x_time_step = 2.0;
uniform float y_time_step = 2.0;
uniform float color_time_step = 1.07;

//void vertex()
//{
//	// Euler's Method:
//	// Next value = timestep * fn() to approx + current value
//	// This approximates the amount to move the verticies in the x and y axes
//	VERTEX.x += (cos(TIME * x_time_step) + VERTEX.x + VERTEX.y) * x_time_step;
//	VERTEX.y += (sin(TIME * y_time_step)) * y_time_step;
//}

void fragment()
{
	// Euler's Method:
	// Next value = timestep * fn() to approx + current value
	// This approximates the amount to move the rgba values
	COLOR.r += cos(TIME * color_time_step) * color_time_step; // Red
	COLOR.b += cos(TIME * color_time_step) * color_time_step; // Blue
	COLOR.a += cos(TIME * 0.6) - 0.9;
}
