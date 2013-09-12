include <lib.scad>;

r1 = 10;
r2 = 7.5;
h = 20;
l = 24;
d = 50;
holder_depth = 2.5;

rod_distance = 40;
difference(){
union(){
	translate([rod_distance/2,0,0]) union(){
		double_bearing_frame(r1, r2, h, l, d, holder_depth);
	}
	translate([-rod_distance/2,0,0]) union(){
		single_bearing_frame(r1, r2, h, l, d, holder_depth);
	}
	translate([0,0,-r1/2]) cube([rod_distance-r1*2, d+2*l, h-r1], center=true);
}
}