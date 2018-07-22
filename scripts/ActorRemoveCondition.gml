with(argument0) {
    for(var n = 0; n < ds_list_size(conditions); n++) {
        var condition = conditions[| n]
        if (ConditionGetType(condition) == argument1) {
            ds_list_delete(conditions, n);
            ConditionDestroy(condition);
            exit;
        }
    }
}
