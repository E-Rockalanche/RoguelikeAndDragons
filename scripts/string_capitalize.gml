// Note: strings start at 1

var str = argument0;
assert(string_length(str) > 0, "capitalize string length is 0");
return string_upper(string_char_at(str, 1)) + string_copy(str, 2, string_length(str)-1);
