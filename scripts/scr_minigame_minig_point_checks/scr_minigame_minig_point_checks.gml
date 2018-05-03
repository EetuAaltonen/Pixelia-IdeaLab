var points = argument0;
var pointCount = ds_list_size(points);
var pointPrev;
var pointNext;
var point;
var i;
var donePercent = 0.7;
doneCount = 0;
var requestLoop = true;

while(requestLoop) {
	requestLoop = false;
	for (i = 1; i < (pointCount-1); i++) {
		point = ds_list_find_value(points, i);
		if (point[1] < yLimit) {
			pointPrev = ds_list_find_value(points, i-1);
			pointNext = ds_list_find_value(points, i+1);
			//Horizontal distance to neighbour points
			/*if (point[0] - pointNext[0] > pointRadius*2 /*|| pointPrev[0] - point[0] > pointRadius*2*//*) {
				point[1] = yLimit-pointRadius;
				//i = 1;
			}*/
			//Vertical distance to neighbour points
			/*if (pointNext[1] > point[1] && pointPrev[1] > point[1]) {
				if (point_distance(point[0], point[1], pointNext[0], pointNext[1]) > (pointRadius*2) &&
					point_distance(point[0], point[1], pointPrev[0], pointPrev[1]) > (pointRadius*2))
				point[1] = (point[1]+((pointPrev[1]+pointNext[1])/2))/2;
				ds_list_set(points, i, point);
				//requestLoop = true;
			}*/
			//if (point_distance(point[0], point[1], pointNext[0], pointNext[1]) > (pointRadius*4)) {
				if (pointNext[1] < point[1] && abs(point[1]-pointNext[1]) > abs(point[1]-pointPrev[1])) {
					pointNext[1] += (abs(point[1]-pointNext[1]) - abs(point[1]-pointPrev[1]))
					ds_list_set(points, i+1, pointNext);
					//requestLoop = true;
				}/* else {
					point[1] = ((pointPrev[1]+pointNext[1])/2);
					ds_list_set(points, i, point);
				}*/
				//requestLoop = true;
			//}
		} else {
			doneCount++;
		}
		/*if (doneCount > pointCount*donePercent) {
			show_message("Ore vein is empty");	
		}*/
	}
}