with(argument0) {
    var defense = 0;
    if (body != NULL) {
        defense =  ArmourGetDefense(body);
    }
    return defense;
}
