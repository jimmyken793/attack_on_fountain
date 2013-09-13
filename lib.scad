module bearing_holder(l, h, r1, r2, holder_depth, holder_thick=2) {
	union(){
		difference(){
			union(){
				translate([-r1,0,-l/2]) cube([r1*2,h,l]);
				cylinder (h = l, r=r1, center = true, $fn=100);
			}
			cylinder (h = l+1, r=r2, center = true, $fn=100);
			translate([0,-r2,0]) cylinder (h = l+1, r=r2, center = true, $fn=100);
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
			translate([0,-(d+l)/2,-h/2+bar_offset]) rotate([0,90,0]) cylinder(r=4, h=r1*2.5,center=true,$fn=100);
			translate([0,(d+l)/2,-h/2+bar_offset]) rotate([0,90,0]) cylinder(r=4, h=r1*2.5,center=true,$fn=100);		
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
			translate([0,-(d+l)/2,-h/2+bar_offset]) rotate([0,90,0]) cylinder(r=4, h=r1*2.5,center=true,$fn=100);
			translate([0,(d+l)/2,-h/2+bar_offset]) rotate([0,90,0]) cylinder(r=4, h=r1*2.5,center=true,$fn=100);	
		}
		translate([0,0,h/4]) cube([r1*2+1,d-4*holder_thick,h/2], center=true);
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
single_bearing_frame(r1, r2, h, l, d, holder_depth, bar_offset=10);
//double_bearing_frame(r1, r2, h, l, d, holder_depth, bar_offset=10);
/*
*/
