include <lib.scad>;
union(){
	feame_connector();
	translate([0,45.5,50]) rotate([90,180,180]) motor_holder();
	translate([0,22.25,43]) cube([48,3.5,23], center=true);
	translate([20.5,21,32]) rotate([0,0,-90]) prism(3.5,45,23);
	translate([-24,21,32]) rotate([0,0,-90]) prism(3.5,45,23);
}