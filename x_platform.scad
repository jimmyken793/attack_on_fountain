include <lib.scad>;

r1 = 10;
r2 = 7.5;
h = 15;
l = 24;
d = 50;
holder_depth = 2.5;

holder_thick = 2;
module drill(pos){
	translate(pos+[0,0,-(h-r1)/2]) cylinder(h=h, r=2.5, center=true, $fn=200);
}
rod_distance = l+d;
difference(){
	union(){
		translate([rod_distance/2,0,0]) union(){
			double_bearing_frame(r1, r2, h, l, d, holder_depth, holder_thick=holder_thick);
		}
		translate([-rod_distance/2,0,0]) union(){
			single_bearing_frame(r1, r2, h, l, d, holder_depth, holder_thick=holder_thick);
		}
		translate([0,0,-r1/2-1]) cube([rod_distance-r1*2, d+2*l, h-r1-2], center=true);
	}

	translate([rod_distance/2,0,-(r1-r2+2)/2+1]) cube([r1*2+1, d-holder_thick*4, r1-r2+4], center=true);
	translate([-rod_distance/2,l/2+(d+l)/4+holder_depth/2,-(r1-r2+2)/2+1]) cube([r1*2+1,(d+l-2*holder_depth)/2+1,r1-r2+4], center=true);
	translate([-rod_distance/2,-(l/2+(d+l)/4+holder_depth/2),-(r1-r2+2)/2+1]) cube([r1*2+1,(d+l-2*holder_depth)/2+1,r1-r2+4], center=true);
	drill([6,(d+l)/2,0]);
	drill([-6,(d+l)/2,0]);
	drill([6,-(d+l)/2,0]);
	drill([-6,-(d+l)/2,0]);
}