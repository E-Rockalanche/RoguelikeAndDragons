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
    WALL,
    FLOOR,
    MUD,
    DOWN,
    LENGTH
};
globalvar tile_flags;
tile_flags[Tile.LENGTH-1] = 0;//set size
tile_flags[Tile.WALL] = TileFlag.SOLID | TileFlag.OBSTRUCTS_VIEW;
