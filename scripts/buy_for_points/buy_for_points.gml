// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// buy_for_points returns "true" if bought or "false" if not bought
function buy_for_points(point_value){
	// If we don't have enough points, return false.
	if global.gScore < point_value {
		return false
	}
	
	// Otherwise, deduct the points, then return true.
	global.gScore -= point_value
	return true

}