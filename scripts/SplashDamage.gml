var total = argument2;
var text_colour = c_red;
if (total == 0) {
    text_colour = c_white;
} else if (total < 0) {
    text_colour = c_green;
}
SplashText(argument0, argument1, string(total), text_colour);
