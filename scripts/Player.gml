var new_player = instance_create(0, 0, obj_actor);
with(new_player) {
    sprite_index = spr_knight;
    alliance = Alliance.GOOD;
    state = ActorState.WAITING;
    is_player = true;
    
    max_hp = 100;
    hp = max_hp;

    var weapon = NULL;
    var armour = NULL;
    switch(choose(1, 2, 3)) {
        case 1:
            weapon = Sword();
            armour = Scale();
        break;
        case 2:
            weapon = Mace();
            armour = Plate();
        break;
        case 3:
            weapon = Rapier();
            armour = Leather();
            sprite_index = spr_rogue;
        break;
    }
    rhand = weapon;
    body = armour;
}
return new_player;
