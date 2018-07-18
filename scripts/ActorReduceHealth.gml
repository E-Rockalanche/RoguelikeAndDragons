with(argument0) {
    var amount = argument1;
    SplashDamage(x, y, amount);
    hp = clamp(hp - amount, 0, max_hp);
    if (hp == 0) {
        actorDie();
    }
}
