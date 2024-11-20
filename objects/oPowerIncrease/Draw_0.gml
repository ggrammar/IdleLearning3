/// @description Insert description here
// You can write your code in this editor
draw_self()

draw_text_transformed(
	x, y, "Increase",
	2, 2, 0
)

draw_text_transformed(
	x, y + 30, "Power: ",
	2, 2, 0
)

draw_text_transformed(
	x, y + 60, string(global.repCost),
	2, 2, 0
)
