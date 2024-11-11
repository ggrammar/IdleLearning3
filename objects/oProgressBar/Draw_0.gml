/// @description Insert description here
// You can write your code in this editor
// x, y,
// x + sprite_width, y + sprite_height
// Allows us to draw the progress bar according to the  
// object's position in the room.
draw_healthbar(
	x, y, 
	(x + sprite_width), (y + sprite_height),
	((alarm_get(0) / (global.repSpeed * room_speed)) * 100),
	c_black,
	c_green,
	c_green,
	1,
	true,
	true
)

//  If t he alarm is not   running, reset it
if alarm_get(0) == -1  {
	alarm_set(0, global.repSpeed * room_speed)
	
	global.gScore += global.repPower
}