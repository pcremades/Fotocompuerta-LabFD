$fn=100;
//--------------------------------------
//Dimensiones de la carcaza (case)
w_case=80;//ancho total
l_case=100;//largo
e_case=2;//espesor pared
h_case=10;//altura
a_case=20;//ancho de cada diente

//Dimensiones del Led y de Photodiodo
w_led=4.4;//ancho led
l_led=5.72;//largo led
h_led=1.5+0.3;//altura led
foco_led=1.22;//dist del foco led al extremo
taco=(h_case-e_case-w_led)/2;//para centrar el centro del led en la case

//Dimensiones de acople (modulos tomados de 
// Customizable Open-source lens holdercleaned up version of http://www.thingiverse.com/thing:26752

//Guide Rod Length
Guide_Rod_Length=20; //Numeric value 
//Guide Rod Diameter
Guide_Rod_Diameter=8; //[2:12]
//Set Screw Diameter
Set_Screw_Diameter=3; //[2:10]
//Set Screw Nut Diameter
Set_Screw_Nut_Diameter=6; //[4:20]
//Set Screw Nut Thickness
Set_Screw_Nut_Thickness=3; //[2:10]

//Simplificacion de variables
//Defines the Guide Rod Length
e=Guide_Rod_Length; //Numeric value 
//Guide Rod Diameter
d=Guide_Rod_Diameter; //[2:12]
//Set Screw Diameter
a=Set_Screw_Diameter; //[2:10]
//Set Screw Nut Diameter
b=Set_Screw_Nut_Diameter; //[4:20]
//Set Screw Nut Thickness
c=Set_Screw_Nut_Thickness; //[2:10]

//Dimensiones tornillos de cierre??


//------------------------------------
difference(){
    base_completa();
    translate([l_case/3,w_case,2.5*e_case])
    rotate([90,0,0])
    cylinder(10,1.5,1.5,center=true);
}
//tapa_completa();
//Case/carcaza base
module base_completa(){
difference(){
union(){
case_base();
translate([l_case/2,(d+6)/2+w_case-1,0])
rotate([0,0,-90])
acople();
    //ajuste led en la case
ajuste_led();
translate([l_case-a_case+a_case-h_led+0.75*e_case,0,0])
mirror([1,0,0])
ajuste_led();
translate([l_case-a_case/2,w_case/4,4])
tornillo();
translate([l_case-a_case/2,w_case-a_case/2,4])
tornillo();
translate([l_case/2,w_case-a_case/2,4])
tornillo();
translate([a_case/2,w_case-a_case/2,4])
tornillo();
translate([a_case/2,w_case/4,4])
tornillo();
}
//hueco led
foco_led();
translate([a_case-e_case/2+l_case-a_case+e_case/2,0,0])
mirror([1,0,0])
foco_led();
ranura_led();
translate([a_case-e_case/2+l_case-a_case+e_case/2,0,0])
mirror([1,0,0])
ranura_led();
}}

//Case/carcaza tapa
module tapa_completa(){
difference(){
union(){
translate ([0,0,12])
linear_extrude(height = e_case) 
    polygon(points=[[0,0],[0,w_case],[l_case,w_case],[l_case,0],[l_case-a_case,0],[l_case-a_case,w_case-a_case],[a_case,w_case-a_case],[a_case,0]]);
translate([a_case-e_case-h_led,2*e_case,e_case+8.2])
#cube([h_led,l_led,taco]);
translate([l_case-a_case+e_case,2*e_case,e_case+8.2])
#cube([h_led,l_led,taco]);
translate([e_case+0.4,e_case+0.2,h_case])
cube([e_case,w_case-2*e_case-0.4,e_case]);
translate([l_case-2*e_case,e_case+0.2,h_case])
cube([e_case,w_case-2*e_case-0.4,e_case]);
translate([e_case+0.4,w_case-2*e_case-0.2,h_case])
#cube([l_case-2*e_case-0.4,e_case,e_case]);
translate([l_case-a_case/2,w_case/4,h_case+e_case/2])
tornillo_tapa();
translate([l_case-a_case/2,w_case-a_case/2,h_case+e_case/2])
tornillo_tapa();
translate([l_case/2,w_case-a_case/2,h_case+e_case/2])
tornillo_tapa();
translate([a_case/2,w_case-a_case/2,h_case+e_case/2])
tornillo_tapa();
translate([a_case/2,w_case/4,h_case+e_case/2])
tornillo_tapa();
}
translate([a_case/2,w_case/4,h_case+e_case/2])
cylinder(8,1.3,1.3,center=true);
translate([a_case/2,w_case-a_case/2,h_case+e_case/2])
cylinder(8,1.3,1.3,center=true);
translate([l_case/2,w_case-a_case/2,h_case+e_case/2])
cylinder(8,1.3,1.3,center=true);
translate([l_case-a_case/2,w_case-a_case/2,h_case+e_case/2])
cylinder(8,1.3,1.3,center=true);
translate([l_case-a_case/2,w_case/4,h_case+e_case/2])
cylinder(8,1.3,1.3,center=true);
}}

module tornillo_tapa(){
difference(){
cylinder(2,4,4,center=true);
cylinder(8,1.3,1.3,center=true);
}}

module tornillo(){
difference(){
cylinder(8,2.5,2.5,center=true);
cylinder(8,1.3,1.3,center=true);
}}

module acople(){
difference(){
union(){
guide_rod();
translate([-0.75*(d+6),0,(d+6)/2])
rotate([0,0,90])
set_screw(0);
}
translate([-(d+6/2),0,(d+6)/2])
rotate([0,90,0])
cylinder(20,(a+1)/2,(a+1)/2,center=true);
}
}

module guide_rod(){
difference(){
translate([0,e/2,(d+6)/2])rotate([90,0,0])cylinder(e,(d+6)/2, (d+6)/2);
translate([0,(e/2)+1,(d+6)/2])rotate([90,0,0])cylinder(e+2,(d+1)/2, (d+1)/2);
}
difference(){
translate([0,0,(d+6)/4])cube([(d+6),e,(d+6)/2], center = true);
translate([0,(e/2)+1,(d+6)/2])rotate([90,0,0])cylinder(e+2,(d+1)/2, (d+1)/2);
}
}
//
module set_screw(h){
difference(){
    translate([0,5,h])rotate([90,0,0])cylinder(10,(b+3)/2, (b+3)/2);
#translate([0,10,h])rotate([90,0,0])cylinder(200,(a+1)/2, (a+1)/2);
translate([0,0,h])nuttrap();
}
difference(){
translate([0,0,h/2])cube([(b+3),10,h], center = true);
translate([0,6,h])rotate([90,0,0])cylinder(12,(a+1)/2, (a+1)/2);
translate([0,0,h])nuttrap();
}
}

module set_screw1(h){
translate([0,5,h])rotate([90,0,0])cylinder(10,(b+3)/2, (b+3)/2);
translate([0,0,h/2])cube([(b+3),10,h], center = true);

}

//nuttrap();
module nuttrap(){
translate([0,(c+1)/2,0])rotate([90,0,0])hexagon(c+1,(b+1)/2);
translate([0,0,(b*3)/2])cube([b+1,c+1,b*3],center = true);
}

module reg_polygon(sides,radius)
{
  function dia(r) = sqrt(pow(r*2,2)/2);  //sqrt((r*2^2)/2) if only we had an exponention op
  if(sides<2) square([radius,0]);
  if(sides==3) triangle(radius);
  if(sides==4) square([dia(radius),dia(radius)],center=true);
  if(sides>4) circle(r=radius,$fn=sides);
}

module hexagonf(radius)
{
  reg_polygon(6,radius);
}

module hexagon(height,radius) 
{
  linear_extrude(height=height) hexagonf(radius);
}


module case_base(){
union(){
   linear_extrude(height = e_case) 
    offset(r = -2) {
       polygon(points=[[0,0],[0,w_case],[l_case,w_case],[l_case,0],[l_case-a_case,0],[l_case-a_case,w_case-a_case],[a_case,w_case-a_case],[a_case,0]]);
    }
linear_extrude(height = h_case) {
   difference() {
    polygon(points=[[0,0],[0,w_case],[l_case,w_case],[l_case,0],[l_case-a_case,0],[l_case-a_case,w_case-a_case],[a_case,w_case-a_case],[a_case,0]]);
       
     offset(r = -2) {
       polygon(points=[[0,0],[0,w_case],[l_case,w_case],[l_case,0],[l_case-a_case,0],[l_case-a_case,w_case-a_case],[a_case,w_case-a_case],[a_case,0]]);
     }
   }
 }
}
}

module ranura_led(){
translate([a_case-e_case,2*e_case+foco_led,e_case+taco+w_led/2])
#cylinder(10,0.75,1);
}

module foco_led(){
translate([a_case-e_case/2,2*e_case+foco_led,e_case+taco+w_led/2])
rotate([0,90,0])
#cylinder(2.5,0.75,1,center=true);
}


module ajuste_led(){
union(){
translate([a_case-e_case-h_led,2*e_case,e_case])
#cube([h_led,l_led,taco]);
translate([a_case-e_case-h_led,e_case,0])
#cube([h_led,e_case,h_case]);
translate([a_case-e_case*2-h_led,e_case,0])
#cube([e_case,e_case+l_led,h_case]);
}
}