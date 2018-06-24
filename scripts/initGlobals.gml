randomize();

globalvar dirs;
dirs[7, 1] = 0;//set size
dirs[0, 0] = 1; dirs[0, 1] = 0;
dirs[1, 0] = 0; dirs[1, 1] = -1;
dirs[2, 0] = -1; dirs[2, 1] = 0;
dirs[3, 0] = 0; dirs[3, 1] = 1;
dirs[4, 0] = 1; dirs[4, 1] = -1;
dirs[5, 0] = -1; dirs[5, 1] = -1;
dirs[6, 0] = -1; dirs[6, 1] = 1;
dirs[7, 0] = 1; dirs[7, 1] = 1;

texture_set_interpolation(false);

enum Race {
    HUMAN,
    ELF,
    LENGTH
};

enum TileFlag {
    DISCOVERED = 1 << 0,
    OBSTRUCTS_VIEW = 1 << 1,
    SOLID = 1 << 2,
    HAS_ACTOR = 1 << 3,
    HAS_OBJECT = 1 << 4,
    HAS_ITEM = 1 << 5,
    IN_VIEW = 1 << 6
};

enum Tile {
    WALL,
    FLOOR,
    DOWN,
    WATER,
    LENGTH
};
globalvar tile_flags;
tile_flags[Tile.LENGTH-1] = 0;//set size
tile_flags[Tile.WALL] = TileFlag.SOLID | TileFlag.OBSTRUCTS_VIEW;

enum Attribute {
    STRENGTH,
    AGILITY,
    VITALITY,
    INTELLIGENCE,
    CHARISMA,
    LENGTH
};

enum GameState {
    TURN_START,
    PLAYER_TURN
};

enum ActorState {
    ANIMATE_PATH,
    READY
};

enum Alliance {
    GOOD,
    BAD
}
