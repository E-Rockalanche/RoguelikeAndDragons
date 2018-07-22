with(argument0) {
    for(var n = 0; n < ds_list_size(conditions) && hp > 0; n++) {
        ConditionAffectActor(conditions[| n], id);
    }
}
