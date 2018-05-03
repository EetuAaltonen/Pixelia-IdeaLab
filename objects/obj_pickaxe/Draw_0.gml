draw_self();

var i;
var point;
var tempPoint;
var pointLineWidth = 5;
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
	//draw_circle_color(point[0], point[1], /*pointLineWidth+1*/pointRadius, c_red, c_red, false);
	if (i+1 < pointCount) {
		tempPoint = ds_list_find_value(points, i+1);
		draw_line_width_color(point[0], point[1], tempPoint[0], tempPoint[1], pointLineWidth, c_yellow, c_yellow);
	}
}

var lineMargin = 50;
draw_line_width_color(lineX1-lineMargin, yLimit, lineX2+lineMargin, yLimit, 4, c_orange, c_orange);

draw_text(x, y-200, string(speed));
draw_text(x, y-210, "Done: " + string(doneCount));