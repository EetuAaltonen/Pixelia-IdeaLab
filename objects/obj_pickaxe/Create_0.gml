//Self
image_speed = 0;
maxSpeed = 80;
acceleration = 10;
canMove = true;

//Points
var startPoint = 80;
var pointMargin = 10;
pointRadius = 10;
yLimit = 500;
doneCount = 0;

points = ds_list_create();
var tempPoints;/* = [
	yLimit, 490, 480, 470,
	460, 450, 440, 430,
	420, 410, 400, 390, 380,
	370, 360, 350, 350,
	350, 340, 330, 320,
	310, 300, 290, yLimit
];*/

randomize();

var pointCount = 22;
var maxHeight = 300;
var minHeight = yLimit - 100;
var rising = true;
var i;
tempPoints[0] = yLimit;
tempPoints[1] = minHeight;
tempPoints[pointCount-1] = minHeight;
tempPoints[pointCount] = yLimit;
for (i = 2; i < pointCount; i++) {
	if (i < pointCount-1) {
		rising = random_range(0, 2);
	}
	if (rising) {
		tempPoints[i] = random_range(tempPoints[i-1], maxHeight);	
	} else {
		tempPoints[i] = random_range(minHeight, tempPoints[i-1]);
	}
}

var arrayLength = array_length_1d(tempPoints);
for (i = 0; i < arrayLength; i++) {
	ds_list_add(points, [startPoint + (pointMargin*(i+1)), tempPoints[i]]);	
}

scr_minigame_minig_point_checks(points);