var total = argument0;
var type = argument1;

var armour = ActorGetArmour(id);

if (type != DamageType.BLUDGEONING) {
    total -= armour;
}

return max(total, 0);
