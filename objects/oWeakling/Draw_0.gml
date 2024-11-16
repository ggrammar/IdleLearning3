/// @description Insert description here
// You can write your code in this editor

// TODO: Is there a better place to do this? Putting it in the "draw"
// function seems repetitive. 

var _weakling_inst = inst_2AAC1FE6
if instance_exists(_weakling_inst) {
	if global.gScore < 10 {
		oWeakling.sprite_index = sWeakling_0
	} else if global.gScore < 20 {
		oWeakling.sprite_index = sWeakling_1
	} else if global.gScore < 30 {
		oWeakling.sprite_index = sWeakling_2
	} else if global.gScore < 40 {
		oWeakling.sprite_index = sWeakling_3
	} else if global.gScore < 50 {
		oWeakling.sprite_index = sWeakling_4
	}
}

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