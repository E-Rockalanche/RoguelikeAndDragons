var rules = argument0;
var str = string_lower(argument1);
var str_length = string_length(str);

if (str_length > rules[? "max_length"]) rules[? "max_length"] = str_length;
if (str_length < rules[? "min_length"]) rules[? "min_length"] = str_length;

if (str_length > 0) {
    var rule_length = rules[? "rule_length"];
    MarkovChainAddRule(rules, '^', string_char_at(str, 1));
    for(var i = 2; i <= str_length; i++) {
        var sub_str = string_copy(str, max(1, i-rule_length), min(i-1, rule_length));
        MarkovChainAddRule(rules, sub_str, string_char_at(str, i));
    }
    var sub_str = string_copy(str, max(1, str_length-rule_length+1), min(str_length, rule_length));
    MarkovChainAddRule(rules, sub_str, '$');
}
