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
damage_type_strings[DamageType.CONCUSSIVE] = "Concussive";
damage_type_strings[DamageType.PSYCHIC] = "Psychic";
damage_type_strings[DamageType.NECROTIC] = "Necrotic";
damage_type_strings[DamageType.ACID] = "Acid";
damage_type_strings[DamageType.POISON] = "Poison";
damage_type_strings[DamageType.LIGHTNING] = "Lightning";
damage_type_strings[DamageType.ICE] = "Ice";
damage_type_strings[DamageType.FIRE] = "Fire";
damage_type_strings[DamageType.PIERCING] = "Piercing";
damage_type_strings[DamageType.SLASHING] = "Slashing";
damage_type_strings[DamageType.BLUDGEONING] = "Bludgeoning";
