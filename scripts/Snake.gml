var new_enemy = instance_create(0, 0, obj_actor);
with(new_enemy) {
    max_hp = 10;
    hp = max_hp;
    sprite_index = spr_snake;
    alliance = Alliance.BAD;
    
    unarmed_damage = Damage(1, 3, DamageType.PIERCING);
}
return new_enemy;
