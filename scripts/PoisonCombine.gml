var effect = argument0;
var combine = argument1;
effect[? "amount"] += combine[? "amount"];
effect[? "time"] = max(effect[? "time"], combine[? "time"]);
