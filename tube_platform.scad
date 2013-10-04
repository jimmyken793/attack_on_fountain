s=8;
d=s/2+5.5 + 0.2;
module drill(pos=[0,0,0], r=2.5){
	translate(pos+[0,0,-(h-r1)/2]) cylinder(h=1000, r=r, center=true, $fn=200);
}
module led_drill(){
	union(){
		translate([3,3,0]) cube([1.5,1.5,10], center=true);
		translate([3,-3,0]) cube([1.5,1.5,10], center=true);
		translate([-3,3,0]) cube([1.5,1.5,10], center=true);
		translate([-3,-3,0]) cube([1.5,1.5,10], center=true);
		cube([s,s,4.5], center=true);
	}
}
union(){
	difference(){
		cube([90,66,5], center=true);
		for(pos=[[-30,18,0],[30,18,0],[30,-10,0],[-30,-10,0]]){
			translate(pos) cylinder(r=5.5,h=20, center=true, $fn=100);
			
			for(offset=[[d,0,0.5],[d,d,0.5],[0,d,0.5],[d,-d,0.5],[-d,0,0.5],[0,-d,0.5],[-d,-d,0.5],[-d,d,0.5]]){
				translate(offset) translate(pos) led_drill();
			}
		}
		for(pos=[[0,0,0],[0,-23,0]]){
			translate(pos) cylinder(r=5.5,h=20, center=true, $fn=100);
			for(offset=[[d,0,0.5],[-d,0,0.5]]){
				translate(offset) translate(pos) led_drill();
			}
		}
		for(offset=[[d,d,0.5],[-d,d,0.5],[0,d,0.5],[0,-d-0.5,0.5],[d,-d-0.5,0.5],[-d,-d-0.5,0.5]]){
				translate(offset) led_drill();
				
		}
		for(pos=[[40,-28,0],[-40,-28,0]]){
			translate(pos) cylinder(r=2.25,h=20, center=true, $fn=100);
		}
	}
	translate([0,28,10]) difference(){
		cube([28,10,16], center=true);
		rotate([90,0,0]) drill([8,0,0]);
		rotate([90,0,0]) drill([-8,0,0]);
	}
}