assert(object_index == obj_game, "AttackGetHitList() not executed by obj_game");

var attack = argument0;
switch(attack[? "type"]) {
    case AttackType.TARGET: 
    case AttackType.RANGED: 
        var list = ds_list_create();
        ds_list_add(list, attack[? "target"]);
        return list;
        
    case AttackType.AREA:   
        return AttackGetAreaHitList(attack);
        
    case AttackType.REACH:   
        return AttackGetReachHitList(attack);
        
    case AttackType.ADJACENT:   
        return AttackGetAdjacentHitList(attack);
        
    case AttackType.SWEEP:   
        return AttackGetSweepHitList(attack);
        
    default:
        assert(false, "AttackGetHitList() type "+string(attack[? "type"])+" not implemented");
}
