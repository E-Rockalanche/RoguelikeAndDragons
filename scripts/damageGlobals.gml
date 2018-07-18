enum DamageType {
    BLUDGEONING,
    SLASHING,
    PIERCING,
    FIRE,
    ICE,
    LIGHTNING,
    POISON,
    ACID,
    NECROTIC,
    PSYCHIC,
    CONCUSSIVE
};

globalvar damage_type_strings;
damage_type_strings[DamageType.CONCUSSIVE] = "concussive";
damage_type_strings[DamageType.PSYCHIC] = "psychic";
damage_type_strings[DamageType.NECROTIC] = "necrotic";
damage_type_strings[DamageType.ACID] = "acid";
damage_type_strings[DamageType.POISON] = "poison";
damage_type_strings[DamageType.LIGHTNING] = "lightning";
damage_type_strings[DamageType.ICE] = "ice";
damage_type_strings[DamageType.FIRE] = "fire";
damage_type_strings[DamageType.PIERCING] = "piercing";
damage_type_strings[DamageType.SLASHING] = "slashing";
damage_type_strings[DamageType.BLUDGEONING] = "bludgeoning";
