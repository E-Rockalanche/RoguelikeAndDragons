var new_enemy = instance_create(0, 0, obj_actor);
with(new_enemy) {
    sprite_index = spr_enemy;
    alliance = Alliance.BAD;
}
return new_enemy;
