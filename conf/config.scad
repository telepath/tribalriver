//length of pipe
l=700;
// (inner) with of pipe
y=150;
//(inner) depth of pipe
z=100;

//wall thickness
w=2;

//axle diameter
ad=10;

// pot diameter
d=min(y,z)*0.75;

//width of inset (along pipes length)
/* x=y*1.5; */
x=d/2+z+w*8;

// x-position of box
pb=x/2-d/2-w*4;

// pots x-position
pp=0;

//non-zero
f=0.05;

RD="round";
SQ="square";

form=RD;
/* form=SQ; */

MAT="MAT";
SRC="TribalRiver";
VER="";
FILE="";

//ACTIONs
RENDER="render";
PRINT="print";
