var str = argument0;
var split_char = argument1;

var array = array_create(0);
var cur_str = "";

for(var n = 1; n <= string_length(str); n++) {
    var char = string_char_at(str, n);
    if ((char == split_char) && string_length(cur_str)) {
        array[array_length_1d(array)] = cur_str;
        cur_str = "";
    } else {
        cur_str += char;
    }
}

if (string_length(cur_str)) {
    array[array_length_1d(array)] = cur_str;
}

return array;
