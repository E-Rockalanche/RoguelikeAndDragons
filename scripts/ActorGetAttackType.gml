with(argument0) {
    var type = AttackType.TARGET;
    
    var weapon = NULL;
    if (rhand != NULL) weapon = rhand;
    else if (lhand != NULL) weapon = lhand;
    
    if (weapon != NULL) {
        if (ItemGetType(weapon) == ItemType.WEAPON) {
            type = WeaponGetAttackType(weapon);
        }
    }
    
    return type;
}
