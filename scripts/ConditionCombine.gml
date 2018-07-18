var condition = argument0;
var combine = argument1;

switch(ConditionGetType(condition)) {
    case Condition.BLEEDING:
        BleedCombine(condition, combine);
    break;
    
    case Condition.STUNNED:
        BleedCombine(condition, combine);
    break;
    
    case Condition.POISONED:
        PoisonCombine(condition, combine);
    break;
    
    default:
        assert(false, "Cannot combine condition "
            + ConditionGetName(condition));
    break;
}

ConditionDestroy(combine);
