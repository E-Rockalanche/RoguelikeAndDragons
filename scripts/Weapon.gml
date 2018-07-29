var weapon = Item();
var type = argument0;
weapon[? "type"] = ItemType.WEAPON;
weapon[? "weapon_type"] = type;
weapon[? "flags"] |= ItemFlag.EQUIPPABLE | weapon_index[type, WeaponIndex.FLAGS];
weapon[? "name"] = weapon_index[type, WeaponIndex.NAME];

var damage_type = weapon_index[type, WeaponIndex.DAMAGE_TYPE];
var low = weapon_index[type, WeaponIndex.DAMAGE_LOW];
var high = weapon_index[type, WeaponIndex.DAMAGE_HIGH];
weapon[? "damage"] = Damage(low, high, damage_type);

weapon[? "attack_type"] = weapon_index[type, WeaponIndex.ATTACK_TYPE];

return weapon;
