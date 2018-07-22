/*
arguments: 
    0: x
    1: y
    2: text
    3: text colour

return value: obj_splash
*/

var splash = instance_create(argument0, argument1, obj_splash);
with(splash) {
    type = SplashType.TEXT;
    text = argument2;
    text_colour = argument3;
    friction = 0.5;
    vspeed = -4;
    alarm[0] = 16;
}
return splash;
