/*
arguments:
    0: width [int]
    1: height [int]
    2: seed chance [float]
    3: max tries [int]
    
return value:
    ds_grid
*/

var blob = NULL;
var num_tries = 0;
while (blob == NULL && num_tries <= argument3) {
    blob = Blob(argument0, argument1, argument2);
}
assert(blob != NULL, "Could not generate blob within dimensions "
    +string(argument0)+" by "+string(argument1)
    +" within "+string(argument3)+" tries");
return blob;
