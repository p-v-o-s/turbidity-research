//this affects the number of facets for rendering more means higher resolution
$fn = 200;

//BODY constraints
BODY_H = 40;
BODY_R = 18/2; //fits inside 20mm diam water bottle

//SCATTERING path constraints
SCATTERING_Y = 30;
SCATTERING_ANGLE = 10;


//EMITTER constraints
EMITTER_HOLE_R = 5/2;  //5mm diameter LEDs
EMITTER_HOLE_L = 2*BODY_H; //arbitrary
EMITTER_FLANGE_W = 2.5*EMITTER_HOLE_R;

//DETECTOR constraints
DETECTOR_HOLE_R = 5/2;  //5mm diameter photodiode
DETECTOR_HOLE_L = 2*BODY_H; //arbitrary
DETECTOR_FLANGE_W = 2.5*DETECTOR_HOLE_R;

//WINDOW SLOT
WINDOW_SLOT_L = 3*BODY_R;
WINDOW_SLOT_H = EMITTER_HOLE_R*2;

//TOP NOTCH
TOP_NOTCH_Z = BODY_H/6;
TOP_NOTCH_H = BODY_H/2; //arbitrary
TOP_NOTCH_W =  2*BODY_R; //arbitrary
TOP_NOTCH_L = BODY_R; //arbitrary

//BOTTOM NOTCH
BOTTOM_NOTCH_Z = -BODY_H/6;
BOTTOM_NOTCH_H =  BODY_H/2; //arbitrary
BOTTOM_NOTCH_W =  2*BODY_R; //arbitrary
BOTTOM_NOTCH_L =  BODY_R;

//BACK NOTCH
BACK_NOTCH_W = BODY_R;
BACK_NOTCH_H = BODY_H; //arbitrary
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
    translate([0,SCATTERING_Y,0])
    rotate([0,90,90 - SCATTERING_ANGLE])
    #cylinder(h=EMITTER_HOLE_L,r=EMITTER_HOLE_R, center = true);
    //EMITTER_FLANGE
    translate([0,-0.8*BODY_R,0])
    rotate([0,90,180 - SCATTERING_ANGLE])
    #cube([EMITTER_FLANGE_W,EMITTER_FLANGE_W,3*BODY_R], center = true);
    //DETECTOR_HOLE
    translate([0,SCATTERING_Y,0])
    rotate([0,90,90 + SCATTERING_ANGLE])
    #cylinder(h=DETECTOR_HOLE_L,r=DETECTOR_HOLE_R, center = true);
    //DETECTOR_FLANGE
    translate([0,-0.8*BODY_R,0])
    rotate([0,90,180 + SCATTERING_ANGLE])
    #cube([DETECTOR_FLANGE_W,DETECTOR_FLANGE_W,3*BODY_R], center = true);
    ////WINDOW_SLOT
    //translate([0,WINDOW_SLOT_L/2 + BODY_R/2,0])
    //cube([WINDOW_SLOT_L,WINDOW_SLOT_L,WINDOW_SLOT_H], center = true);
    //TOP_NOTCH
    translate([0,-TOP_NOTCH_L/2 + BODY_R/2,TOP_NOTCH_H/2 + TOP_NOTCH_Z])
    cube([TOP_NOTCH_W,TOP_NOTCH_L,TOP_NOTCH_H], center = true);
    //BOTTOM_NOTCH
    translate([0,-BOTTOM_NOTCH_L/2 + BODY_R/2,-BOTTOM_NOTCH_H/2 + BOTTOM_NOTCH_Z])
    cube([BOTTOM_NOTCH_W,BOTTOM_NOTCH_L,BOTTOM_NOTCH_H], center = true);
    //BACK_NOTCH
    translate([0,-BODY_R,0])
    #cube([BACK_NOTCH_W,BACK_NOTCH_W,BACK_NOTCH_H], center = true);
  }
}

//render part for 3D printing
rotate([-90,0,0])
optics_mount();