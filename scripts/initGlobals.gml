randomize();

globalvar delta;
delta = 1;

setViewPort();
mouseGlobals();
setDirs();
actorGlobals();
mapGlobals();

globalvar new_enemy_in_sight;
new_enemy_in_sight = false;

enum GameState {
    NEXT_ROUND,
    NEXT_TURN,
    HIGHLIGHT_MOVE_AREA,
    PLAYER_TURN,
    AI_TURN,
    MOVE_ACTOR,
    MOVE_ACTORS
};
