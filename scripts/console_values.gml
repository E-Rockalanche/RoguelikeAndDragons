var str = "";
for(var i = 0; i < argument_count; i++) {
    if (i > 0) str += ", ";
    str += string(argument[i]);
}
show_debug_message(str);
