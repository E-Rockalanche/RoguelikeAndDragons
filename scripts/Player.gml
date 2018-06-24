var new_player = instance_create(0, 0, obj_actor);
with(new_player) {
    sprite_index = spr_player;
    alliance = Alliance.GOOD;
}
return new_player;
