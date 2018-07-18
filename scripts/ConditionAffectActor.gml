var condition = argument0;
var actor = argument1;
if (ConditionHasRoundEffect(condition)) {
    switch(ConditionGetType(condition)) {
        case Condition.BLEEDING:
            BleedAffectActor(condition, actor);
        break;
        
        case Condition.POISONED:
            PoisonAffectActor(condition, actor);
        break;
        
        default:
            assert(false, "ConditionAffectActor() case not implemented: " + ConditionGetName(condition));
        break;
    }
}
