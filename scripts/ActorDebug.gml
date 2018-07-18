with(argument0) {
    var str = "Name: " + name;
    
    str += "#HP: " + string(hp) + "/" + string(max_hp);
    
    var damage = NULL;
    if (rhand != NULL) damage = WeaponGetDamage(rhand);
    else if (unarmed_damage != NULL) damage = unarmed_damage;
    if (damage != NULL) {
        str += "#Damage: " + string(DamageGetLow(damage)) + "-" + string(DamageGetHigh(damage))
            + " " + damage_type_strings[DamageGetType(damage)];
    }
    
    str += "#Armour: " + string(ActorGetArmour(id));
    
    for(var n = 0; n < ds_list_size(conditions); n++) {
        var condition = conditions[| n];
        str += "#" + ConditionGetName(condition) + " " + string(ConditionGetTime(condition)) + "s";
    }
    
    return str;
}
