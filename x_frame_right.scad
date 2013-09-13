include <lib.scad>;

r1 = 10;
r2 = 7.5;
h = 40;
l = 24;
d = 50;
holder_depth = 2.5;
holder_thick = 2;
difference(){
	union(){
		single_bearing_frame(r1, r2, h, l, d, holder_depth, bar_offset=10);
		translate([20,12,0]) cube([21, 4, 20], center=true);
		translate([20,-12,0]) cube([21, 4, 20], center=true);
	}
	translate([0,0,0]) cube([21, 20, 20], center=true);
	translate([20,0,0]) rotate([90,0,0]) cylinder(h=30, r=4.5, center=true, $fn=100);
	
}
