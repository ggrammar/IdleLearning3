/// @description Insert description here
// You can write your code in this editor


// TODO: Is there a better place to do this? Putting it in the "draw"
// function seems repetitive. I guess we just need to check the score 
// after each time the progress bar is complete, not every draw frame.
// We could also only increment the sprite, rather than regressing 
// each time you make a big purchase, but I like seeing the progression
// animation over and over again. 

// Set the sprite based on  how many points we've earned. 
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

// Sync oWeakling's sprite animation frame with the progress bar. This allows
// the animation to speed up as we purchase speed upgrades. 
// TODO: How can we write this to account for possible range-of-motion upgrades?
// progress bar instance ID
var _inst = inst_61B8692F
if instance_exists(_inst) {

	var _range_of_motion = 3
	// If sprite_get_number returns 2, our frames are 0 and 1. 	
	// Pick the smaller value - total number of frames in the sprite, or total upgradeable
	//  range of motion. 
	var _number_of_frames = min(sprite_get_number(oWeakling.sprite_index), _range_of_motion)
	
	// In order to account for reversed frames, double the number of frames and
	// subtract 2 (one for the beginning of the animation, one for the end). 
	var _true_number_of_frames = 2 * _number_of_frames -  2
	
	// Figure out how far along the progress bar is. 
	var _progress_percent = (_inst.alarm[0] / (global.repSpeed * room_speed)) * 100
	
	// What is the division of 100% that we need? For 2 frames, this will be 50%, 
	// for three frames, this will be 33%, etc. 
	var _original_progress_increment = floor(100 / _true_number_of_frames)
	
	var _image_index_value = 0
	var _progress_increment = _original_progress_increment
	while(true) {
		
		// If the progress bar is less than the current calculated increment,
		// this is where we want to set the image! 
		if _progress_percent <= _progress_increment {
			image_index = _image_index_value
			break
		
		// Otherwise, advance the window that we're checking, and the image 
		// index we'll use once we find a match. 
		} else {
			// If we're past the 50% mark, progress the animation. This needs
			// to be less than _or equal to_ 50 -- for example, a two-frame
			// animation's first frame will be at the 50% mark, and we need
			// to move forward there.
			if _progress_increment <= 50 {
				_image_index_value += 1
			//  Otherwise, regress the animation. 
			} else {
				_image_index_value -= 1
			}
			// Also, check the next increment. 
			_progress_increment += _original_progress_increment
		}
	}
}

draw_self()