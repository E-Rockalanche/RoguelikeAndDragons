with(argument0) {
    var condition = argument1;
    for(var n = 0; n < ds_list_size(conditions); n++) {
        var cur = conditions[| n];
        if (ConditionGetType(condition) == ConditionGetType(cur)) {
            ConditionCombine(cur, condition);
            exit;
        }
    }
    ds_list_add(conditions, condition);
}
