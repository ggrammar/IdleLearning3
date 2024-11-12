/// @description Insert description here
// You can write your code in this editor

// progress bar instance ID
_inst = inst_61B8692F

// TODO: Generalize this so that it works for more than one frame, so we
// can offer an upgrade to range-of-motion. 
if instance_exists(_inst) {
	
	// number_of_frames = array_length(image_index)
	
	// if the progress bar is halfway complete, set this animation frame
	if (((_inst.alarm[0] / (global.repSpeed * room_speed)) * 100) <= 50) {
		image_index = 0
	
	// otherwise, set that animation frame
	} else {
		image_index = 1
	}
}

draw_self()