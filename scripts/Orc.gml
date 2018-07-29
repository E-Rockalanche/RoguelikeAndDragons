var new_enemy = instance_create(0, 0, obj_actor);
with(new_enemy) {
    max_hp = 10;
    hp = 10;
    sprite_index = spr_orc;
    alliance = Alliance.BAD;

    rhand = WeaponFactory();
    
    var armour = NULL;
    switch(choose(1, 2, 3, 4)) {
        case 1:
            armour = Leather();
        break;
        case 2:
            armour = Scale();
        break;
        case 3:
            weapon = Plate();
        break;
    }
    body = armour;
}
return new_enemy;
