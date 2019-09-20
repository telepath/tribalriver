include <lib/river.scad>

/* a=90; */
a=20;
/* a=20+70-70*$t; */

n=l/x;
/* n=1; */
rotate([0, 90-a, 0]) {
  *%pipe();

  for (i=[1:n]) {
    /* render() */
    translate([l/2-x*(i-0.5), 0, 0]) {
      translate([pb, 0, 0]) {
        %box();
      }
      translate([0, 0, 0]) {
        rotate([0, -(90-a), 0]) {
          pot();
        }
      }
    }
  }
}
