
module tubes(){
	translate([10,0,0])rotate([90,0,0])cylinder(h=100, r=2, center=true, $fn=20);
	translate([-10,0,0])rotate([90,0,0])cylinder(h=100, r=2, center=true, $fn=20);
	translate([0,50,0])rotate([90,0,90])cylinder(h=105, r=2, center=true, $fn=20);
	translate([0,-50,0])rotate([90,0,90])cylinder(h=105, r=2, center=true, $fn=20);
	translate([31.25,-25,0])rotate([90,0,90-49.64])cylinder(h=65.622, r=2, center=true, $fn=20);
	translate([-31.25,-25,0])rotate([90,0,90+49.64])cylinder(h=65.622, r=2, center=true, $fn=20);
	translate([31.25,25,0])rotate([90,0,90+49.64])cylinder(h=65.622, r=2, center=true, $fn=20);
	translate([-31.25,25,0])rotate([90,0,90-49.64])cylinder(h=65.622, r=2, center=true, $fn=20);	

	//vertical
	translate([10,40,12.5])rotate([0,-20,90])cylinder(h=25, r=2, center=true, $fn=20);
	translate([10,-44,12.5])rotate([0,0,90])cylinder(h=25, r=2, center=true, $fn=20);
	translate([-10,-44,12.5])rotate([0,0,90])cylinder(h=25, r=2, center=true, $fn=20);
	translate([-10,40,12.5])rotate([0,-20,90])cylinder(h=25, r=2, center=true, $fn=20);

	//top
	translate([10,0,27])rotate([90,0,0])cylinder(h=92, r=2, center=true, $fn=20);
	translate([-10,0,27])rotate([90,0,0])cylinder(h=92, r=2, center=true, $fn=20);
}

module props(){
	translate([105/2,100/2,15])rotate([0,0,0])cylinder(h=1, r=78/2, center=true, $fn=100);
	translate([105/2,100/2,5])rotate([0,0,0])cylinder(h=20, r=2, center=true, $fn=100);
	
	translate([-105/2,-100/2,15])rotate([0,0,0])cylinder(h=1, r=78/2, center=true, $fn=100);
	translate([-105/2,-100/2,5])rotate([0,0,0])cylinder(h=20, r=2, center=true, $fn=100);
	
	translate([-105/2,100/2,15])rotate([0,0,0])cylinder(h=1, r=78/2, center=true, $fn=100);
	translate([-105/2,100/2,5])rotate([0,0,0])cylinder(h=20, r=2, center=true, $fn=100);
	
	translate([105/2,-100/2,15])rotate([0,0,0])cylinder(h=1, r=78/2, center=true, $fn=100);
	translate([105/2,-100/2,5])rotate([0,0,0])cylinder(h=20, r=2, center=true, $fn=100);
}

module screws(){
	translate([15,15,0])cylinder(r=1.5, center=true, h=20, $fn=20);
	translate([-15,15,0])cylinder(r=1.5, center=true, h=20, $fn=20);
	translate([15,-15,0])cylinder(r=1.5, center=true, h=20, $fn=20);
	translate([-15,-15,0])cylinder(r=1.5, center=true, h=20, $fn=20);
}



//tubes();
// screws();
//props();

module frame_rear(){
	difference(){
		translate([0,0,0])linear_extrude(height = 6, center = true, convexity = 10, $fn=40) 
			import(file = "SS135.dxf", layer = "rear");
		translate([10,0,0])rotate([90,0,0])cylinder(r=2, h=40, center=true, $fn=100);
		translate([-10,0,0])rotate([90,0,0])cylinder(r=2, h=40, center=true, $fn=100);	
	}
	

}

module frame_front(){
	difference(){
		union(){
			translate([0,0,0])linear_extrude(height = 6, center = true, convexity = 10, $fn=40) 
				import(file = "SS135.dxf", layer = "face");
			translate([0,-3,0])rotate([20,0,0])translate([0,0,2.5])cylinder(r=4, h=11, center=true, $fn=100);
		}
		translate([0,-3,0])rotate([20,0,0])cylinder(r=2, h=30, center=true, $fn=100);	
		translate([10,0,0])rotate([90,0,0])cylinder(r=2, h=30, center=true, $fn=100);
		translate([-10,0,0])rotate([90,0,0])cylinder(r=2, h=30, center=true, $fn=100);	
		translate([0,0,-8])cube([10,20,10], center=true);

	}

}

module frame(){
	difference(){
		
		union(){
			translate([0,-50,0])linear_extrude(height = 6, center = true, convexity = 10, $fn=40) 
				import(file = "SS135.dxf", layer = "frame");

			//vertical
			translate([10,43,4])rotate([0,-20,90])cylinder(h=5, r=4, center=true, $fn=20);
			translate([10,-44,4])rotate([0,0,90])cylinder(h=5, r=4, center=true, $fn=20);
			translate([-10,-44,4])rotate([0,0,90])cylinder(h=5, r=4, center=true, $fn=20);
			translate([-10,43,4])rotate([0,-20,90])cylinder(h=5, r=4, center=true, $fn=20);
		}
		
		translate([105/2,50,6])cylinder(r=16.5/2, h=10, center=true);
		translate([-105/2,50,6])cylinder(r=16.5/2, h=10, center=true);
		translate([105/2,-50,6])cylinder(r=16.5/2, h=10, center=true);
		translate([-105/2,-50,6])cylinder(r=16.5/2, h=10, center=true);

		translate([-105/2,-50,5])rotate([90,0,-65])cylinder(r=4, h=40, center=true, $fn=100);
		translate([105/2,-50,5])rotate([90,0,-65-45])cylinder(r=4, h=40, center=true, $fn=100);
		
		translate([105/2,50,5])rotate([90,0,-65])cylinder(r=4, h=40, center=true, $fn=100);
		translate([-105/2,50,5])rotate([90,0,-65-45])cylinder(r=4, h=40, center=true, $fn=100);

		tubes();
		screws();
		//translate([0,-20,0])cube([140,100,100], center=true);
		//translate([100,10,0])cube([140,100,100], center=true);	
		//translate([-100,10,0])cube([140,100,100], center=true);	
	}
	translate([0,-45,30])rotate([90,0,0])frame_rear();

}


frame_rear();
/*

Tube Lengths
============
4 x 52.435
2 x 89.501
2 x 96
*/



// difference(){
// 	translate([0,-50,0])linear_extrude(height = 6, center = true, convexity = 10, $fn=40) 
// 		import(file = "SS135.dxf", layer = "frame");
// 	tubes();
// 	screws();
// }