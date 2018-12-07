draw_self();

var i;
var point;
var prevPoint;
var lineWidth = 4;
var pointCount = ds_list_size(points); //array_length_1d(points);
var lineX1 = 0;
var lineX2 = 0;

for (i = 0; i < pointCount; i++) {
	point = ds_list_find_value(points, i);
	if (i == 0) {
		lineX1 = point[0];
	} else if (i == pointCount - 1) {
		lineX2 = point[0];
	}
	if (i > 0) {	
		prevPoint = ds_list_find_value(points, i-1);
		draw_line_width_color(prevPoint[0], prevPoint[1], point[0], point[1], lineWidth, c_yellow, c_yellow);
		if (prevPoint[1] > point[1]) {
			draw_triangle_color(prevPoint[0], prevPoint[1], point[0], point[1],
			point[0], prevPoint[1], c_gray, c_gray, c_gray, false);
			draw_rectangle_color(prevPoint[0], prevPoint[1], point[0], yLimit,
			c_gray, c_gray, c_gray, c_gray, false);
		} else {
			draw_triangle_color(prevPoint[0], prevPoint[1], point[0], point[1],
			prevPoint[0], point[1], c_gray, c_gray, c_gray, false);
			draw_rectangle_color(prevPoint[0], point[1], point[0], yLimit,
			c_gray, c_gray, c_gray, c_gray, false);
		}
	}
	draw_circle_color(point[0], point[1], lineWidth+1, c_red, c_red, false);
}

var lineMargin = 50;
draw_line_width_color(lineX1-lineMargin, yLimit, lineX2+lineMargin, yLimit, 4, c_orange, c_orange);

draw_text(x, y-200, string(speed));
draw_text(x, y-210, "Done: " + string(doneCount));