/// @description Insert description here
// You can write your code in this editor

// Something something, these are more appropriate in a 
// Draw GUI event? As opposed to a Draw event? I don't
// understand why, though. 

draw_self()

draw_set_font(fDefaultFont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text_ext(
	x, y, "Increase Speed: " + string(global.repSpeedCost),
	12, 100
)
