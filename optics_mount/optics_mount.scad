//this affects the number of facets for rendering more means higher resolution
$fn = 200;

//BODY constraints
BODY_H = 80;
BODY_R = 14;

//EMITTER constraints
EMITTER_HOLE_R = 5/2;  //5mm diameter LEDs
EMITTER_HOLE_L = 2*BODY_H; //arbitrary

//DETECTOR constraints
DETECTOR_HOLE_R = 5/2;  //5mm diameter photodiode
DETECTOR_HOLE_L = 2*BODY_H; //arbitrary

//WINDOW SLOT
WINDOW_SLOT_L = 3*BODY_R;
WINDOW_SLOT_H = EMITTER_HOLE_R*2;

//TOP NOTCH
TOP_NOTCH_Z = BODY_H/6;
TOP_NOTCH_H = BODY_H/2; //arbitrary
TOP_NOTCH_L = BODY_H/2; //arbitrary

//BOTTOM NOTCH
BOTTOM_NOTCH_Z = -BODY_H/6;
BOTTOM_NOTCH_H =  BODY_H/2; //arbitrary
BOTTOM_NOTCH_L =  BODY_H/2; //arbitrary
//
//---------------------------------------------------------------
module optics_mount()
{
  difference()
  {
    //---------------------------------------
    //first object is constructive
    //BODY 
    translate([0,0,-BODY_H/2])
    cylinder(h=BODY_H,r=BODY_R);
    //---------------------------------------
    //remaining objects are subtractive
    //EMITTER_HOLE
    translate([0,BODY_H/10,0])
    rotate([0,90,45])
    translate([0,0,-EMITTER_HOLE_L/2])
    cylinder(h=EMITTER_HOLE_L,r=EMITTER_HOLE_R);
    //DETECTOR_HOLE
    translate([0,BODY_H/10,0])
    rotate([0,90,135])
    translate([0,0,-DETECTOR_HOLE_L/2])
    cylinder(h=DETECTOR_HOLE_L,r=DETECTOR_HOLE_R);
    //WINDOW_SLOT
    translate([0,WINDOW_SLOT_L/2 + BODY_R/2,0])
    cube([WINDOW_SLOT_L,WINDOW_SLOT_L,WINDOW_SLOT_H], center = true);
    //TOP_NOTCH
    translate([0,-TOP_NOTCH_L/2 + BODY_R/2,TOP_NOTCH_H/2 + TOP_NOTCH_Z])
    cube([TOP_NOTCH_L,TOP_NOTCH_L,TOP_NOTCH_H], center = true);
    //BOTTOM_NOTCH
    translate([0,-BOTTOM_NOTCH_L/2 + BODY_R/2,-BOTTOM_NOTCH_H/2 + BOTTOM_NOTCH_Z])
    cube([BOTTOM_NOTCH_L,BOTTOM_NOTCH_L,BOTTOM_NOTCH_H], center = true);
  }
}

//render part
optics_mount();