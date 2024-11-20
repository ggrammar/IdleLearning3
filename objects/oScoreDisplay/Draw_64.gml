/// @description Insert description here
// You can write your code in this editor


draw_set_color(c_white)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext(
	x + 150, y + 60, string("Swole Points: " + string(global.gScore)),
	12, 200
)