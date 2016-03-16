

s=40;
c=s*.8;
r=3;
rb=14;
h=s*1.2;

cd=r*2;
module example004()
{

difference() {
difference() {
	difference() {
      translate([0,0,-s])
		cylinder(h=2*s,r=rb);
      union() {
         translate([0,s/5,0])
      		rotate([0,90,45]) 
         translate([0,0,-h/2])
				cylinder(h=h,r=2*r);

         translate([0,s/5,0])
			rotate([0,90,135])
          translate([0,0,-h/2])
				cylinder(h=h,r=2*r);
      }
	}
//rotate([0,0,45])

translate([-cd*2.5,cd*1.3,-cd])
cube([cd*5,cd*5,cd*2]);
}

union() {
rotate([0,0,0])
translate([-s/2,-s/2,s/3])
cube([s,s/1.5,s]);

rotate([0,0,0])
translate([-s/2,-s/2,-1.3*s])
cube([s,s/1.5,s]);
}

}


}

example004();

