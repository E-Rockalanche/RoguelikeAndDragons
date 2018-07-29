with(argument0) {
    var reduce_time = argument1;
    for(var n = 0; n < ds_list_size(conditions) && hp > 0; n++) {
        var condition = conditions[| n];
        
        var condition_time = ConditionGetTime(condition);
        
        var effect_time = floorNearest(condition_time - 1, ROUND_TIME);
        
        if (condition_time - reduce_time <= effect_time) {
            ConditionAffectActor(condition, id);
        }
        
        if ActorIsDead(id) exit;
        
        ConditionReduceTimer(condition, reduce_time);
        
        if (condition_time - reduce_time <= 0) {
            ds_list_delete(conditions, n);
            ConditionDestroy(condition);
            n--;
        }
    }
}
