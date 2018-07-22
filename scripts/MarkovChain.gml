var rules = ds_map_create();
var rule_length = argument0;
assert(rule_length > 0, "Setting markov chain rule length to "+rule_length);
rules[? "rule_length"] = rule_length;
rules[? "min_length"] = 1000000;
rules[? "max_length"] = 0;
return rules;
