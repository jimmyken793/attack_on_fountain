difference(){
	cube([100,28,5], center=true);
	translate([42, 8, 0]) cylinder(r=2.5,h=10, center=true, $fn=100);
	translate([42, -8, 0]) cylinder(r=2.5,h=10, center=true, $fn=100);
	translate([-42, 8, 0]) cylinder(r=2.5,h=10, center=true, $fn=100);
	translate([-42, -8, 0]) cylinder(r=2.5,h=10, center=true, $fn=100);
}