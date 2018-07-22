if keyboard_check_pressed(ord('1')) {
    show_debug_message("gameConsoleCommand()");

    var str = get_string("console command", "");
    
    var args = string_split(str, ' ');
    
    for(var n = 0; n < array_length_1d(args); n++) {
        show_debug_message("arg"+string(n)+"'"+args[n]+"'");
    }
    
    if (array_length_1d(args) > 0) {
        switch(args[0]) {
            case "view":
                gameViewCommand(str, args);
                break;
                
            case "kill":
                gameKillCommand(str, args);
                break;
                
            default:
                show_debug_message("Invalid command: "+str);
        }
    } else {
        show_debug_message("Invalid command: "+str);
    }
}
