var condition = argument0;
var combine = argument1;
condition[? "amount"] += combine[? "amount"];
condition[? "time"] = max(condition[? "time"], combine[? "time"]);
