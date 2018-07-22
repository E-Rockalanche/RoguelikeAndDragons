enum Condition {
    BLEEDING,
    STUNNED,
    POISONED,
    LENGTH
};

globalvar CONDITION_HAS_ROUND_EFFECT, CONDITION_CAN_COMBINE;
CONDITION_HAS_ROUND_EFFECT = getBit(Condition.BLEEDING) | getBit(Condition.POISONED);
CONDITION_CAN_COMBINE = getBit(Condition.BLEEDING) | getBit(Condition.POISONED);

globalvar condition_names;
condition_names[Condition.POISONED] = "Poisoned";
condition_names[Condition.STUNNED] = "Stunned";
condition_names[Condition.BLEEDING] = "Bleeding";

globalvar condition_icons;
condition_icons[Condition.POISONED] = spr_poisoned;
condition_icons[Condition.STUNNED] = spr_stunned;
condition_icons[Condition.BLEEDING] = spr_bleeding;
