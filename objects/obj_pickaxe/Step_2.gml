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
			if (point_distance(x, y, point[0], point[1]) < pointRadius+speed/2) {
				hitToPoint = true;
				y += 20;
				point[1] += 20;
				ds_list_set(points, i, point);
				if (point[1] > yLimit) {
					ds_list_delete(points, i);
					pointCount = ds_list_size(points);
				}
				
				var pointPrev;
				var pointNext;
				for (i = 1; i < (pointCount-1); i++) {
					pointPrev = ds_list_find_value(points, i-1);
					point = ds_list_find_value(points, i);
					pointNext = ds_list_find_value(points, i+1);
					//Horizontal distance to neighbour points
					if (point[0] - pointNext[0] > pointRadius*2 /*|| pointPrev[0] - point[0] > pointRadius*2*/) {
						point[1] = yLimit-pointRadius;
					}
					//Vertocal distance to neighbour points
					else if (point[1]+pointRadius < pointNext[1]/*point[1]+pointRadius < pointPrev[1] || */) {
						point[1] = ((pointPrev[1]+pointNext[1])/2);
					}
					
					ds_list_set(points, i, point);
				}
				
				canMove = false;
				alarm[1] = 0.20*room_speed;
				break;
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