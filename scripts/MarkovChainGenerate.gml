var rules = argument0;
var rule_length = rules[? "rule_length"];
var min_length = rules[? "min_length"];
var max_length = rules[? "max_length"];
while(true){
    var str = '';
    do {
        var sub_str;
        if (string_length(str) == 0)
            sub_str = '^';
        else
            sub_str = string_copy(str, max(1, string_length(str)-rule_length+1), min(string_length(str), rule_length));
        var char = MarkovChainGetValue(rules, sub_str);
        if (char != '$')
            str += char;
    } until(char == '$');
    assert(str != "", "Markov chain generated empty string");
    if (string_length(str) >= min_length && string_length(str) <= max_length)
        return str;
}
