with(argument0) {
    var damage = argument1;
    
    var total = 0;
    if (damage != NULL) {
        total = actorModifyDamage(DamageCalculate(damage), DamageGetType(damage));
        if (total > 0 && chance(100)) {
            switch(DamageGetType(damage)) {
                case DamageType.SLASHING:
                    ActorAddCondition(id, Bleed(1, 4 * ROUND_TIME));
                    SplashText(x, y-16, "Bleeding", c_red);
                break;
                
                case DamageType.BLUDGEONING:
                    ActorAddCondition(id, Stun(ROUND_TIME));
                    SplashText(x, y-16, "Stunned", c_yellow);
                break;
                
                case DamageType.PIERCING:
                    ActorAddCondition(id, Poison(1, 4 * ROUND_TIME));
                    SplashText(x, y-16, "Poisoned", c_purple);
                break;
            }
        }
    }
    
    ActorReduceHealth(id, total);
}
