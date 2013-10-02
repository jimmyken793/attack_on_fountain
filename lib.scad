module prism(l, w, h) {
translate([0, l, 0]) rotate( a= [90, 0, 0])
linear_extrude(height = l) polygon(points = [
[0, 0],
[w, 0],
[0, h]
], paths=[[0,1,2,0]]);
}

module bearing_holder(l, h, r1, r2, holder_depth, holder_thick=2) {
	union(){
		difference(){
			union(){
				translate([-r1,0,-l/2]) cube([r1*2,h,l]);
				cylinder (h = l, r=r1, center = true, $fn=100);
			}
			translate([0,-r1/2,0]) cube([r1*2+1, r1, l+1], center=true);
			translate([0,r1,0]) cube([r1*2+1, 3, 6], center=true);
			cylinder (h = l+1, r=r2, center = true, $fn=100);
		}
		translate([0,(h+r2-holder_thick)/2,l/2+holder_thick/2]) cube([r1*2,h-r2+holder_thick,holder_thick], center=true);
		translate([0,(h+r2-holder_thick)/2,-(l/2+holder_thick/2)]) cube([r1*2,h-r2+holder_thick,holder_thick], center=true);
	}
}

module single_bearing_frame(r1, r2, h, l, d, holder_depth, holder_thick=2, bar_offset=false){
	difference(){
		union(){
			translate([0,0,h/2]) rotate([-90,0,0]) bearing_holder(l, h, r1, r2, holder_depth);
			translate([0,l/2+(d+l)/4,-r2/2+holder_depth/2]) cube([r1*2,(d+l)/2,h-r2+holder_depth], center=true);
			translate([0,-(l/2+(d+l)/4),-r2/2+holder_depth/2]) cube([r1*2,(d+l)/2,h-r2+holder_depth], center=true);
		}
		if (bar_offset != false){
			translate([0,-(d+l)/2,-h/2+bar_offset]) rotate([0,90,0]) cylinder(r=4.5, h=r1*2.5,center=true,$fn=100);
			translate([0,(d+l)/2,-h/2+bar_offset]) rotate([0,90,0]) cylinder(r=4.5, h=r1*2.5,center=true,$fn=100);		
		}
		translate([0,-(l/2+(d+l)/4+holder_thick/2+1),h/4]) cube([r1*2+1,(d+l)/2-holder_thick+2,h/2], center=true);
		translate([0,(l/2+(d+l)/4+holder_thick/2+1),h/4]) cube([r1*2+1,(d+l)/2-holder_thick+2,h/2], center=true);
	}
}

module double_bearing_frame(r1, r2, h, l, d, holder_depth, holder_thick=2, bar_offset=false){
	difference(){
		union(){
			translate([0,-((d+l)/2-holder_thick),h/2]) rotate([-90,0,0]) bearing_holder(l, h, r1, r2, holder_depth);
			translate([0,(d+l)/2-holder_thick,h/2]) rotate([-90,0,0]) bearing_holder(l, h, r1, r2, holder_depth);

			translate([0,0,-r2/2+holder_depth/2]) cube([r1*2,d-holder_thick*2,h-r2+holder_depth], center=true);

			translate([0,d/2+l-holder_thick/2,-r2/2+holder_depth/2]) cube([r1*2,holder_thick,h-r2+holder_depth], center=true);
			translate([0,-d/2-l+holder_thick/2,-r2/2+holder_depth/2]) cube([r1*2,holder_thick,h-r2+holder_depth], center=true);
		}
		if (bar_offset != false){
			translate([0,-(d+l)/2,-h/2+bar_offset]) rotate([0,90,0]) cylinder(r=4.5, h=r1*2.5,center=true,$fn=100);
			translate([0,(d+l)/2,-h/2+bar_offset]) rotate([0,90,0]) cylinder(r=4.5, h=r1*2.5,center=true,$fn=100);	
		}
		translate([0,0,h/4]) cube([r1*2+1,d-4*holder_thick,h/2], center=true);
	}
}

module motor_holder(){
	rotate([90,0,0]) difference(){
		translate([0,-1.9,0]) cube([50,46.2,10],center=true);
		translate([0,1,3]) cube([42.4,44.4,7],center=true);
		for(pos = [[-15.5,15.5,0],[15.5,15.5,0],[15.5,-15.5,0],[-15.5,-15.5,0]]){
			translate(pos) cylinder(r=1.7,h=11,center=true,$fn=100);
		}
		
		translate([0,21,-3]) cube([23.4,42.4,7],center=true);
		cylinder(r=11.5,h=20,center=true,$fn=100);
	}
}

module feame_connector(){
	translate([0,0,12.5]) difference(){
		cube([48,48,40], center=true);
		translate([0,0,6]) cube([41.1,41.1,40], center=true);
	}
	translate([0,0,5]) difference(){
		union(){
			translate([0,34,0]) cube([30,20,25], center=true);
		}
		translate([0,33,0]) rotate([0,90,0]) cylinder(r=4.5,h=31,center=true,$fn=100);
	}
}

module nut_holder(r1=5, r2=4, h=6){
	difference(){
		rotate([0,90,0]) cylinder(h=h,r=5,$fn=6,center=true);
		rotate([0,90,0]) cylinder(h=h+1,r=4,$fn=6,center=true);
	}
}

/*
r1 = 10;
r2 = 7.5;
h = 40;
l = 24;
d = 50;
holder_depth = 2.5;
//bearing_holder(l, h, r1, r2, holder_depth);
//single_bearing_frame(r1, r2, h, l, d, holder_depth, bar_offset=10);
//double_bearing_frame(r1, r2, h, l, d, holder_depth, bar_offset=10);
//motor_holder();
feame_connector();
/*
*/
