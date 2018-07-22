with(argument0) {
    var tile = argument1;
    
    switch(tile) {
        case Tile.GRASS_TALL:
        case Tile.WATER:
            return 2;
        default:
            return 1;
    }
}
