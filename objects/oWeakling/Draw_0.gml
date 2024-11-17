/// @description Insert description here
// You can write your code in this editor


// TODO: Is there a better place to do this? Putting it in the "draw"
// function seems repetitive. I guess we just need to check the score 
// after each time the progress bar is complete, not every draw frame.
// We could also only increment the sprite, rather than regressing 
// each time you make a big purchase, but I like seeing the progression
// animation over and over again. 

// Set the sprite based on how many points we've earned. 
var _weakling_inst = inst_2AAC1FE6
if instance_exists(_weakling_inst) {
	
	// Every 10 points, we get a new sprite. 
	var _weakling_sprite_index = floor(global.gScore / 10)
	
	// Load the sprite from the string representation of its name (sWeakling_0, etc). 
	var _weakling_sprite_name = string_concat("sWeakling_", _weakling_sprite_index)	
	var _weakling_sprite = asset_get_index(_weakling_sprite_name)

	// Make sure the sprite exists before loading it - if we attempt to load a non-
	// existent sprite, the game halts. If we run out of sprites, the game will
	// continue to use the last-set sprite, which should be the strongest. Although
	// I suppose there's an edge case where we _skip_ a sprite because we're gaining
	// too many points. 
	if sprite_exists(_weakling_sprite) {
		oWeakling.sprite_index = _weakling_sprite
	} else {
		// If the sprite doesn't exist, we've run out of weakling sprites. This is
		// as close as we have to a win condition right now. 
		draw_text(x, y, "MAXIMUM BULK ACHIEVED!!!")
	}
}


// progress bar instance ID
var _inst = inst_61B8692F
if instance_exists(_inst) {
	// Sync oWeakling's sprite animation frame with the progress bar. This allows
	// the animation to speed up as we purchase speed upgrades. 

	// If sprite_get_number returns 2, our frames are 0 and 1. 	
	// Pick the smaller value - total number of frames in the sprite, or total upgradeable
	//  range of motion. 
	var _number_of_frames = min(sprite_get_number(oWeakling.sprite_index), global.repRangeOfMotion)
	
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