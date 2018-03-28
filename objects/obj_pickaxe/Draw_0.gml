draw_self();

var i;
var point;
var tempPoint;
var pointCount = ds_list_size(points); //array_length_1d(points);

for (i = 0; i < pointCount; i++) {
	point = ds_list_find_value(points, i);
	draw_circle_color(point[0], point[1], pointRadius, c_white, c_white, false);
	if (i+1 < pointCount) {
		tempPoint = ds_list_find_value(points, i+1);
		draw_line_width_color(point[0], point[1], tempPoint[0], tempPoint[1], 4, c_yellow, c_yellow);
	}
}

draw_text(x, y-200, string(speed));