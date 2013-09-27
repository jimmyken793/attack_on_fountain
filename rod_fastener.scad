include <lib.scad>;

l=10;
h=23;
r1=8;
r2=4.3;
r3=2.2;
d=6;

difference(){
	union(){
		cube([r1*2,(h-r1),l], center=true);
		translate([0,(h-r1)/2,0]) cylinder(r=r1,h=l,$fn=100,center=true);
		translate([r1-d+6,-(h-r1)/8,0]) nut_holder();
	}
	translate([0,(h-r1)/2,0]) cylinder(r=r2,h=l+1,$fn=100,center=true);
	cube([d,(h-r1)+1,l+1], center=true);
	translate([0,-(h-r1)/8,0]) rotate([0,90,0]) cylinder(r=r3,h=r1*2+1,$fn=100,center=true);
}