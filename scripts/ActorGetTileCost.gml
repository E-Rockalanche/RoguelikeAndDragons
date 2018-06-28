with(argument0) {
    var tile = argument1;
    
    switch(tile) {
        case Tile.MUD:
            return 2;
        default:
            return 1;
    }
}
