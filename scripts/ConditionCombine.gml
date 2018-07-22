var condition = argument0;
var combine = argument1;

assert(condition[? "type"] == combine[? "type"], "ConditionCombine() types are not equal");

if (getBit(condition[? "type"]) & CONDITION_CAN_COMBINE) {
    switch(condition[? "type"]) {
        case Condition.BLEEDING:
            BleedCombine(condition, combine);
        break;
        
        case Condition.POISONED:
            PoisonCombine(condition, combine);
        break;
    }
}

ConditionDestroy(combine);
