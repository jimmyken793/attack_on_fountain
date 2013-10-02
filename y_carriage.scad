include <lib.scad>;
d = 50;
l = 24;
h=7;
holder_depth = 2.5;
holder_thick = 2;

rotate([90,180,0]) difference(){
	union(){
		cube([d+l+4.5*4,4.5*4,10], center=true);
		for(pos=[10,-10]){
			translate([pos,4.5*2-h/2,0]) rotate([90,90,0]) union(){
				cube([10,10,h], center=true);
				translate([5,0,0]) cylinder(r=5,h=h,center=true,$fn=100);
				translate([-5,0,0]) cylinder(r=5,h=h,center=true,$fn=100);
			}
		}
	}
	for(pos=[10,-10]){
		translate([pos,4.5*2-h/2,0]) rotate([90,90,0]) union(){
			translate([6,0,0]) cylinder(h=200, r=2.1, center=true, $fn=200);
			translate([-6,0,0]) cylinder(h=200, r=2.1, center=true, $fn=200);
		}
	}
	translate([0,-4,0]) cube([45+10,4.5*4-h+1,11], center=true);
	//translate([0,0,0]) cube([21, 9.5, 20], center=true);
	translate([(d+l)/2,0,0])  cylinder(h=30, r=4.5, center=true, $fn=100);
	translate([-(d+l)/2,0,0])  cylinder(h=30, r=4.5, center=true, $fn=100);
	
}