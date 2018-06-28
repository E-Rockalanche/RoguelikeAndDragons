var rules = argument0;
var fin = file_text_open_read(argument1);
while(!file_text_eof(fin)) {
    var str = file_text_read_string(fin);
    file_text_readln(fin);
    MarkovChainAnalyzeString(argument0, str);
}
file_text_close(fin);
