var new_enemy = instance_create(0, 0, obj_actor);
with(new_enemy) {
    sprite_index = spr_orc;
    alliance = Alliance.BAD;

    var weapon = NULL;
    switch(choose(1, 2, 3)) {
        case 1:
            weapon = Sword();
        break;
        case 2:
            weapon = Mace();
        break;
        case 3:
            weapon = Rapier();
        break;
    }
    rhand = weapon;
    
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
