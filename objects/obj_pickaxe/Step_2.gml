if (canMove) {	
	var targX = mouse_x;
	var targY = mouse_y;
	var fracture = 30;
	var donePercent = 0.8;

	var hitToPoint = false;

	if (vspeed > round(maxSpeed*0.3)) {
		var i;
		var point, pointPrev, pointNext;
		var maxPointDistance = fracture/2;
		var pointCount = ds_list_size(points); //array_length_1d(points);
		
		for (i = 0; i < pointCount; i++) {
			point = ds_list_find_value(points, i); //points[i];
			if (point[1] < yLimit) {
				if (point_distance(x, y, point[0], point[1]) < (pointRadius*2)+speed/2) {
					hitToPoint = true;
					point[1] += fracture;
					y = point[1];
					if (point[1] > yLimit) {
						point[1] = yLimit;
						//ds_list_delete(points, i);
						//pointCount = ds_list_size(points);
					}
					ds_list_set(points, i, point);
					
					var a;
					var tempPoint, tempDistance;
					for (a=-4; a < 5; a++) {
						if (a != 0) {
							if (i+a > 0 && i+a < pointCount) {
								tempPoint = ds_list_find_value(points, i+a);
								tempDistance = maxPointDistance - round(maxPointDistance*(1/abs(a)));
								if (tempPoint[1] < yLimit && tempPoint[1] < point[1]) {
									if (point[1] - tempPoint[1] > tempDistance) {
										tempPoint[1] += ((point[1] - tempPoint[1]) - tempDistance);
									}
									if (tempPoint[1] > yLimit) {
										tempPoint[1] = yLimit;
									}
									ds_list_set(points, i+a, tempPoint);
								}
							}
						}
					}
				
					canMove = false;
					alarm[1] = 0.20*room_speed;
					
					//Check Mine Percent
					doneCount = 0;
					for (i = 1; i < (pointCount-1); i++) {
						point = ds_list_find_value(points, i);
						if (point[1] >= yLimit) {
							doneCount++;
						}
					}
					if (doneCount >= round((pointCount-2)*donePercent)) {
						show_message("Ore vein is empty." + string(doneCount) + " / " + string(round((pointCount-2)*donePercent)) + " mined.");	
						//game_end();
					}
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