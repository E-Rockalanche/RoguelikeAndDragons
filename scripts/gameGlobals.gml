randomize();

globalvar deltam step, new_enemy_in_sight, display_orientation;
delta = 1;
step = 0;
new_enemy_in_sight = false;
display_orientation = display_get_orientation();

globalvar ASPECT_RATIO, VIEW_WVIEW, VIEW_HVIEW, dwidth, dheight, HUD_SCALE;
setViewPort();

draw_set_font(fnt_default);

enum GameState {
    NEXT_ROUND,
    NEXT_TURN,
    TURN_START,
    HIGHLIGHT_MOVE_AREA,
    PLAYER_TURN,
    END_PLAYER_TURN,
    AI_TURN,
    MOVE_ACTOR,
    MOVE_ACTORS,
    ACTOR_ATTACKING
};

enum SplashType {
    SPRITE,
    TEXT
};

enum ViewState {
    MOVE_FOCUS_TO_ACTOR,
    FOCUS_ON_ACTOR,
    PLAYER_CONTROL
};
