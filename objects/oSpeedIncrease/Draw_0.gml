/// @description Insert description here
// You can write your code in this editor
// draw_set_alpha(global.alpha_value)
draw_self()

draw_text_transformed(
	x, y, "Increase",
	2, 2, 0
)

draw_text_transformed(
	x, y + 30, "Speed: ",
	2, 2, 0
)

draw_text_transformed(
	x, y + 60, string(global.repSpeedCost),
	2, 2, 0
)
	