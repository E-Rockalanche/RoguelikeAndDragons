with(argument0) {
    for(var n = 0; n < ds_list_size(conditions); n++) {
        if (ConditionGetType(conditions[| n]) == argument1) {
            return true;
        }
    }
    return false;
}
