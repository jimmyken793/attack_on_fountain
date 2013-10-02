include <lib.scad>;
include <lib.scad>;

feame_connector();

translate([0,44.5,50]) difference(){
	union(){
		translate([0,0,-16]) difference(){
			cube([48,48,20], center=true);
			translate([-3,3,0]) cube([43,43,12], center=true);
		}
	}
	translate([0,0,-10]) cylinder(r=4,h=50,center=true,$fn=100);
}


