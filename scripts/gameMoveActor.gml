/*
arguments:
    0: path
*/
assert(object_index == obj_game, "moveActor() not being executed by obj_game");

ActorSetPath(current_actor, argument0);
MapUnsetActor(map, current_actor);
state = GameState.MOVE_ACTOR;
