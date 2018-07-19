/*
arguments:
    0: path
*/

ActorSetPath(current_actor, argument0);
MapUnsetActor(map, current_actor);
state = GameState.MOVE_ACTOR;
