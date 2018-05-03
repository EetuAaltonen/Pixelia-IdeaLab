if (canMove) {	
	var targX = mouse_x;
	var targY = mouse_y;

	var hitToPoint = false;

	if (vspeed > round(maxSpeed*0.3)) {
		var i;
		var point;
		var pointCount = ds_list_size(points); //array_length_1d(points);

		for (i = 0; i < pointCount; i++) {
			point = ds_list_find_value(points, i); //points[i];
			if (point[0] < yLimit) {
				if (point_distance(x, y, point[0], point[1]) < pointRadius+speed/2) {
					hitToPoint = true;
					y += 20;
					point[1] += 20;
					ds_list_set(points, i, point);
					if (point[1] > yLimit) {
						point[1] = yLimit;
						ds_list_set(points, i, point);
						//ds_list_delete(points, i);
						//pointCount = ds_list_size(points);
					}
					
					scr_minigame_minig_point_checks(points);
				
					canMove = false;
					alarm[1] = 0.20*room_speed;
					break;
				}
			}
		}
	}

	if (point_distance(x, y, targX, targY) > speed+acceleration && !hitToPoint) {
		if (speed < maxSpeed) {
			speed += acceleration;
		}
		move_towards_point(targX, targY, speed);
	} else {
		speed = 0;
	}
}