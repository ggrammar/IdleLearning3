/// @description Insert description here
// You can write your code in this editor
if (global.repSpeed > 0.1) {
	global.repSpeed -= 0.1
}

// TODO:  This works in conjunction with a draw_set_alpha call
// in the draw event, but it applies to both buttons for some 
// reason. Fix this before re-enabling. 
// if (global.repSpeed == 0.1) {
	//  global.alpha_value = 0.5
// }