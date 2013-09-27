include <lib.scad>;

r1 = 10;
r2 = 7.5;
h = 40;
l = 24;
d = 50;
holder_depth = 2.5;
holder_thick = 2;
drill_offsets = [[6,9,0],[-6,9,0],[6,-9,0],[-6,-9,0]];
drill_pos = [-24,0,0];
difference(){
	union(){
		single_bearing_frame(r1, r2, h, l, d, holder_depth, bar_offset=10);
		translate([18.5,7.5,0]) cube([34, 6, 18], center=true);
		translate([18.5,-7.5,0]) cube([34, 6, 18], center=true);
		translate([-13-r1,0,5]) cube([26, 28, 6], center=true);
	}
	translate([27,0,0]) rotate([90,0,0]) cylinder(h=30, r=5, center=true, $fn=100);
	translate(drill_pos) for(pos = drill_offsets){
		translate(pos) cylinder(h=30, r=2.5, center=true, $fn=100);
	}
}
