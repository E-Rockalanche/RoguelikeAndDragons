var condition = argument0;
var time = condition[? "time"];
if (time != FOREVER) {
    condition[? "time"] = time - argument1;
}
