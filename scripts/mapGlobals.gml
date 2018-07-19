enum TileFlag {
    DISCOVERED = 1 << 0,
    OBSTRUCTS_VIEW = 1 << 1,
    SOLID = 1 << 2,
    HAS_ACTOR = 1 << 3,
    HAS_OBJECT = 1 << 4,
    HAS_ITEM = 1 << 5,
    IN_ACTIVE_VIEW = 1 << 6,
};

enum Tile {
    VOID,
    FLOOR,
    GRASS,
    WELL,
    WALL,
    DOOR_CLOSED,
    DOOR_OPEN,
    STAIRS_UP,
    STAIRS_DOWN,
    ASH,
    DOOR_LOCKED,
    ALTAR,
    WALL_DECAL,
    BARRICADE,
    BRIDGE,
    GRASS_TALL,
    DOOR_HIDDEN,
    TRAP_POISON,
    TRAP_POISON_HIDDEN,
    TRAP_FIRE,
    TRAP_FIRE_HIDDEN,
    TRAP_PARALYSIS,
    TRAP_PARALYSIS_HIDDEN,
    TRAP_UNARMED,
    FLOOR_DECAL,
    EXIT_LOCKED,
    EXIT,
    TRAP_CONFUSION,
    TRAP_CONFUSION_HIDDEN,
    SIGN,
    TRAP_ALARM,
    TRAP_ALARM_HIDDEN,
    TRAP_SUMMON,
    TRAP_SUMMON_HIDDEN,
    WELL_WATER,
    STATUE,
    STATUE2,
    TRAP_BLEED,
    TRAP_BLEED_HIDDEN,
    TRAP_FREEZE,
    TRAP_FREEZE_HIDDEN,
    BOOKCASE,
    POT,
    FLOOR_EDGE,
    BRIDGE_EDGE,
    WALL_EDGE,
    WATER_EDGE,
    FLOOR_UNDERWATER,
    WATER,
    LENGTH
};

globalvar tile_flags;
tile_flags[Tile.LENGTH-1] = 0;//set size
tile_flags[Tile.WALL] = TileFlag.SOLID | TileFlag.OBSTRUCTS_VIEW;
tile_flags[Tile.DOOR_CLOSED] = TileFlag.OBSTRUCTS_VIEW;
tile_flags[Tile.DOOR_LOCKED] = TileFlag.OBSTRUCTS_VIEW;
tile_flags[Tile.DOOR_HIDDEN] = TileFlag.OBSTRUCTS_VIEW;

globalvar tile_names;
tile_names[Tile.WALL] = "Wall";
tile_names[Tile.FLOOR] = "Floor";
tile_names[Tile.VOID] = "Void";
tile_names[Tile.GRASS] = "Grass";
tile_names[Tile.GRASS_TALL] = "Tall grass";
tile_names[Tile.WALL_DECAL] = "Wall decal";
tile_names[Tile.FLOOR_DECAL] = "Floor decal";
