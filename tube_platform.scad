s=7.5;
d=s/2+5.5 + 0.2;

difference(){
	cube([90,66,5], center=true);
	for(pos=[[-30,18,0],[30,18,0],[30,-10,0],[-30,-10,0]]){
		translate(pos) cylinder(r=5.5,h=20, center=true, $fn=100);
		
		for(offset=[[d,0,0.5],[d,d,0.5],[0,d,0.5],[d,-d,0.5],[-d,0,0.5],[0,-d,0.5],[-d,-d,0.5],[-d,d,0.5]]){
			translate(offset) translate(pos) cube([s,s,4.5], center=true);
		}
	}
	for(pos=[[0,0,0],[0,-23,0]]){
		translate(pos) cylinder(r=5.5,h=20, center=true, $fn=100);
		for(offset=[[d,0,0.5],[-d,0,0.5]]){
			translate(offset) translate(pos) cube([s,s,4.5], center=true);
		}
	}
	for(offset=[[d,d,0.5],[-d,d,0.5],[0,d,0.5],[0,-d-0.5,0.5],[d,-d-0.5,0.5],[-d,-d-0.5,0.5]]){
			translate(offset) cube([s,s,4.5], center=true);
	}
	for(pos=[[40,-28,0],[-40,-28,0]]){
		translate(pos) cylinder(r=2.25,h=20, center=true, $fn=100);
	}
}