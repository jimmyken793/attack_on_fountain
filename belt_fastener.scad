include <lib.scad>;
h=7;
drill_pos = [[6,0,0],[-6,0,0]];
difference(){
	union(){
		cube([10,12,h], center=true);
		for(pos = drill_pos){
			translate(pos) cylinder(r=6,h=h,center=true,$fn=100);
			translate(pos) translate([0,0,h/2]) rotate([0,90,0]) nut_holder();
		}
	}

	for(pos = drill_pos){
		translate(pos) cylinder(h=20, r=2.5, center=true, $fn=200);
	}
}