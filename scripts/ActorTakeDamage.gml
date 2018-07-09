with(argument0) {
    var damage = argument1;
    
    hp -= damage;
    
    if (hp <= 0) {
        hp = 0;
        actorDie();
    } else if (hp > max_hp) {
        hp = max_hp;
    }
    
    var text_colour = c_red;
    if (damage == 0) {
        text_colour = c_white;
    } else if (damage < 0) {
        text_colour = c_green;
    }
    SplashText(x, y, string(damage), text_colour);
}
