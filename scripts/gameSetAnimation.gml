/*
arguments:
    0: animation frames
*/
assert(object_index == obj_game, "gameSetAnimation() not being executed by obj_game");

var time = argument0;

if (time > 0) {
    alarm[0] = time;
    animation = true;
} else {
    animation = false;
}
