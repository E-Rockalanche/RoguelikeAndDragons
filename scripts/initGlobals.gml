randomize();

globalvar deltam step, new_enemy_in_sight;
delta = 1;
step = 0;
new_enemy_in_sight = false;

draw_set_font(fnt_default);

setViewPort();
mouseGlobals();
setDirs();
actorGlobals();
mapGlobals();

enum GameState {
    NEXT_ROUND,
    NEXT_TURN,
    HIGHLIGHT_MOVE_AREA,
    PLAYER_TURN,
    AI_TURN,
    MOVE_ACTOR,
    MOVE_ACTORS,
    ACTOR_ATTACKING
};

enum SplashType {
    SPRITE,
    TEXT
};
