var angle = argument0;

var octant = angleGetOctant(angle);

var angle_mod_45 = angle mod 45;

var angle_off_90;
if (octant mod 2 == 1) {
    angle_off_90 = 45 - angle_mod_45;
} else {
    angle_off_90 = angle_mod_45;
}

assert(angle_off_90 >= 0 && angle_off_90 <= 45, "angleGetOctantSlope() angle_off_90 outside octant");

return dtan(angle_off_90);
