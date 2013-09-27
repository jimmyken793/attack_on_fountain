include <lib.scad>;


difference(){
	union(){
		feame_connector();
		translate([0,0,-16]) difference(){
			cube([48,48,17], center=true);
			translate([-3,3,4]) cube([43,43,12], center=true);
		}
	}
	translate([0,0,-10]) cylinder(r=4,h=50,center=true,$fn=100);
}