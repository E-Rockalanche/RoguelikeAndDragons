var new_enemy = instance_create(0, 0, obj_actor);
with(new_enemy) {
    max_hp = 5;
    hp = 5;
    sprite_index = spr_snake;
    alliance = Alliance.BAD;
    
    unarmed_damage = Damage(1, 3, DamageType.PIERCING);
}
return new_enemy;
