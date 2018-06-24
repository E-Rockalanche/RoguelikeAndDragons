/*
argument1:
    0: bit [int]

return value:
    bitset<32>
*/
assert(argument0 < 32, "bit >= 32");
return 1 << argument0;
