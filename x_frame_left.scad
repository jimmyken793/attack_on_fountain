include <lib.scad>;

r1 = 12;
r2 = 7.5;
h = 40;
l = 24;
d = 50;
holder_depth = 2.5;
holder_thick = 2;
difference(){
	union(){
		double_bearing_frame(r1, r2, h, l, d, holder_depth, holder_thick=holder_thick, bar_offset=10);
		translate([25+r1,-20,-5]) cube([50,10,10], center=true);
		translate([25+r1,-20,25]) motor_holder();
		translate([0,0,h/4-holder_depth]) cube([r1*2, d-holder_thick*4, h/2-r2+holder_depth], center=true);
		translate([13,0,-10]) cube([3, 30, 20], center=true);
	}
	translate([0,0,0]) cube([r1*2+1, 9.5, 31], center=true);
	translate([0,0,3.25]) cube([9, 20, 15.5], center=true);
	translate([-5,0,0]) cube([15, 20, 9], center=true);
	
}