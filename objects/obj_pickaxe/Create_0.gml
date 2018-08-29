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
var tempPoints = [
	yLimit, 490, 480, 470,
	460, 450, 440, 430,
	420, 410, 400, 390, 380,
	370, 360, 350, 350,
	350, 340, 330, 320,
	310, 300, 290, yLimit
];

var i;
var arrayLength = array_length_1d(tempPoints);
for (i = 0; i < arrayLength; i++) {
	ds_list_add(points, [startPoint + (pointMargin*(i+1)), tempPoints[i]]);	
}

scr_minigame_minig_point_checks(points);