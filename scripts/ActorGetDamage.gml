with(argument0) {
    var damage = NULL;
    if (rhand != NULL) {
        damage = WeaponGetDamage(rhand);
    } else {
        damage = unarmed_damage;
    }
    return damage;
}
