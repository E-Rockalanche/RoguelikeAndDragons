with(argument0) {
    var range = 1;
    
    var weapon = NULL;
    if (rhand != NULL) weapon = rhand;
    else if (lhand != NULL) weapon = lhand;
    
    show_debug_message("weapon: "+string(weapon));
    
    if (weapon != NULL) {
        show_debug_message("item type: "+string(ItemGetType(weapon)));
        
        if (ItemGetType(weapon) == ItemType.WEAPON) {
            show_debug_message("weapon type: "+string(WeaponGetType(weapon)));
        
            switch(WeaponGetType(weapon)) {
                case WeaponType.SPEAR:
                    range = 2;
                    break;
                    
                case WeaponType.BOW:
                    range = attributes[Attribute.STRENGTH];
                    break;
                    
                default:
                    range = 1;
            }
        }
    }
    
    show_debug_message("attack range: "+string(range));
    
    return range;
}
