//Self
image_speed = 0;
maxSpeed = 80;
acceleration = 5;
canMove = true;

//Points
pointRadius = 5;
yLimit = 500;

points = ds_list_create();
var tempPoints = [
	[100, 400],
	[110, 390],
	[120, 380],
	[130, 370],
	[140, 360],
	[150, 350],
	[160, 350],
	[170, 350],
	[180, 340],
	[190, 330],
	[200, 320],
	[210, 310],
	[220, 300],
	[230, 290]
];

var i;
var arrayLength = array_length_1d(tempPoints);
for (i = 0; i < arrayLength; i++) {
	ds_list_add(points, tempPoints[i]);	
}