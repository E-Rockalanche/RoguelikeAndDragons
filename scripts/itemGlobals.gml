enum ItemFlag {
    EQUIPPABLE = 1 << 0,
    CONSUMABLE = 1 << 1,
    READABLE = 1 << 2,
    STACKABLE = 1 << 3,
    VERSATILE = 1 << 4,
    FINESSE = 1 << 5,
    THROWN = 1 << 6,
    REACH = 1 << 7,
    HEAVY = 1 << 8,
    LIGHT = 1 << 9,
    TWO_HANDED = 1 << 10,
    AMMUNITION = 1 << 11,
    REQUIRES_AMMO = 1 << 12,
    RANGED = 1 << 13
};

enum ItemType {
    WEAPON,
    ARMOUR,
    FOOD,
    OTHER,
    LENGTH
};
