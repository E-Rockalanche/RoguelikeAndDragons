with(argument0) {
    var amount = argument1;
    for(var n = 0; n < ds_list_size(conditions) && hp > 0; n++) {
        var cur = conditions[| n];
        ConditionReduceTimer(cur, amount);
        if (ConditionGetTime(cur) <= 0) {
            ds_list_delete(conditions, n);
            ConditionDestroy(cur);
            n--;
        }
    }
}
