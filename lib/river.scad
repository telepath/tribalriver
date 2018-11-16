include <conf/config.scad>

// square / round box
module sqrd(
  x,
  y,
  z,
  form=form
) {
  difference() {
    if (form==RD) {
      resize([x, y, z*2]) {
        rotate([0, 90, 0]) {
          cylinder(d=y, h=x, center=true);
        }
      }
    } else {
      translate([0, 0, -z/2]) {
        cube(size=[x, y, z], center=true);
      }
    }
    translate([0, 0, z]) {
      cube(size=[x*2,y*2,z*2], center=true);
    }
  }
}

// rounded square / round box
module sqrdrd(
  x,
  y,
  z,
  form=form
) {
  h=min(x,y,z);
  intersection()
  {
    sqrd(x, y, z, form=form );
    rotate([0, 0, 90]) {
      sqrd(y, x, z, form=RD );
    }
    /* union() {
      rotate([90, 0, 0]) {
        translate([0, 0, h-z]) {
          cylinder(r=h, h=y, center=true);
        }
      }
      translate([0, 0, h-z]) {
        cube(size=[x,y,z-h], center=true);
      }
    } */
  }
}

// twice rounded square / round box
module sqrdrdrd() {
  sqrdrd(x=x,y=y,z=z);
}

module pipe(
l=l,
y=y,
z=z,
w=w
) {
  difference() {
    sqrd(l+2*w,y+w*2,(z+w));
    translate([0, 0, f]) {
      sqrd(l,y,z+f);
    }
  }
}

module box(
  x=x-w*4,
  y=y-w*4,
  z=z-w*2,
  w=w
) {
  h=min(y,z);
  difference()
  {
    intersection() {
      sqrd(x=x,y=y,z=z);
      translate([-x/2+d/10, 0, d/2.5]) {
        sphere(d=max(y,z)*2);
      }
    }
    translate([0, 0, f]) {
      intersection() {
        sqrd(x=x-w*2,y=y-w*2,z=z-w);
        translate([-x/2+d/10, 0, d/2.5]) {
          sphere(d=(max(y,z)-w)*2);
        }
      }
    }
    //inflow
    translate([-x/2, 0, 0]) {
      rotate([0, 90, 0]) {
        cylinder(d=d*0.75, h=x/2, center=true);
      }
    }
    //outflow
    translate([x/2, 0, d/5]) {
      rotate([0, 90, 0]) {
        cylinder(d=d*0.75, h=x/2, center=true);
      }
    }
  }
  // pot holder
  translate([-pb, 0, 0]) {
    difference() {
      rotate([90, 0, 0]) {
        difference() {
          cylinder(d=ad+w*2, h=y-w*2, center=true);
          cylinder(d=ad+w, h=y-w*2, center=true);
          cylinder(d=ad*2, h=y-ad*2, center=true);
        }
      }
      translate([-ad, 0, ad/2]) {
        cube(size=[ad*2, y+ad, ad], center=true);
      }
    }
  }
}

module pot(
  d=d,
  z=z,
  ad=ad,
  w=w
) {
  echo(str("pot(d=",d,",z=",z,",ad=",ad,",w=",2,")"));
  difference() {
    union() {
      resize([0,0,(z-w*6)*2]){
        sphere(d=d+w*2);
      }
      rotate([90, 0, 0]) {
        cylinder(d=ad, h=y-w*8, center=true);
      }
    }
    resize([0,0,(z-w*8)*2]){
      sphere(d=d);
    }
    translate([0, 0, z/2]) {
      cube(size=[d*2,d*2,z], center=true);
    }
  }
}
