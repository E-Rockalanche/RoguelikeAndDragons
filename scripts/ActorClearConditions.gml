with(argument0) {
    for(var n = 0; n < ds_list_size(conditions); n++) {
        ConditionDestroy(conditions[| n]);
    }
    ds_list_clear(conditions);
}
