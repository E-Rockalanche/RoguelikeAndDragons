/*
arguments: 
    0: text

return value: obj_splash
*/

var splash = instance_create(0, 0, obj_splash);
with(splash) {
    type = SplashType.TEXT;
    text = argument0;
    text_colour = c_white;
    alarm[0] = 30;
    image_alpha = 0;
    alpha_change = 0.1;
    anchor_to_view_center = true;
}
return splash;
