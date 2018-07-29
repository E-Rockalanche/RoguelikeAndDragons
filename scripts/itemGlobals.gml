enum ItemType {
    WEAPON,
    ARMOUR,
    FOOD,
    OTHER,
    LENGTH
};

enum ItemFlag {
    EQUIPPABLE = 1 << 0,
    CONSUMABLE = 1 << 1,
    READABLE = 1 << 2,
    STACKABLE = 1 << 3,
    
    //weapon flags
    THROWN = 1 << 4,
    REACH = 1 << 5,
    TWO_HANDED = 1 << 6,
    AMMUNITION = 1 << 7,
    REQUIRES_AMMO = 1 << 8,
    RANGED = 1 << 9
};

enum WeaponType {
    SWORD,
    MACE,
    AXE,
    SPEAR,
    DAGGER,
    FLAIL,
    BOW,
    LENGTH
};

enum WeaponIndex {
    NAME,
    DAMAGE_TYPE,
    DAMAGE_LOW,
    DAMAGE_HIGH,
    ATTACK_TYPE,
    FLAGS,
    LENGTH
}

globalvar weapon_index;
weapon_index[WeaponType.LENGTH-1, WeaponIndex.LENGTH-1] = 0;

//all weapon flags will be assigned EQUIPPABLE during instantiation

setRow(weapon_index, WeaponType.SWORD,  "Sword",    DamageType.SLASHING,    4, 6, AttackType.TARGET,    0);
setRow(weapon_index, WeaponType.MACE,   "Mace",     DamageType.BLUDGEONING, 4, 6, AttackType.TARGET,    0);
setRow(weapon_index, WeaponType.AXE,    "Axe",      DamageType.SLASHING,    4, 6, AttackType.ADJACENT,  ItemFlag.THROWN);
setRow(weapon_index, WeaponType.SPEAR,  "Spear",    DamageType.PIERCING,    4, 6, AttackType.REACH,     ItemFlag.THROWN | ItemFlag.REACH | ItemFlag.TWO_HANDED);
setRow(weapon_index, WeaponType.DAGGER, "Dagger",   DamageType.PIERCING,    4, 6, AttackType.TARGET,    0);
setRow(weapon_index, WeaponType.FLAIL,  "Flail",    DamageType.BLUDGEONING, 4, 6, AttackType.SWEEP,     0);
setRow(weapon_index, WeaponType.BOW,    "Bow",      DamageType.PIERCING,    4, 6, AttackType.RANGED,    ItemFlag.RANGED | ItemFlag.REQUIRES_AMMO | ItemFlag.TWO_HANDED);
