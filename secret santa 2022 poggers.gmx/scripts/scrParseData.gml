///scrParseData(name)

var name = argument0;
var filename = "Data/" + name + ".txt";
var data = ds_grid_create(1024, 3);
ds_grid_clear(data, -1);
if file_exists(filename) {
    var file = file_text_open_read(filename);
        global.bpm = real(file_text_readln(file));
        global.bits = real(file_text_readln(file));
        global.offset = real(file_text_readln(file));
        
        var i = 0;
        while(!file_text_eof(file)) {
            var line = file_text_readln(file);
            if string_length(line) > 0 && string_digits(string_char_at(line, 1)) != "" {
                var p = string_pos(" ", line);
                var beat = real(string_copy(line, 1, p - 1));
                line = string_delete(line, 1, p);
                p = string_pos(" ", line);
                var bit = real(string_copy(line, 1, p - 1));
                line = string_delete(line, 1, p);
                p = string_pos(" ", line);
                var attack = string_copy(line, 1, p - 1);
                line = string_delete(line, 1, p);
                //p = string_pos(" ", line);
                var spawn = real(line);
                /*if ord(string_char_at(attack, string_length(attack))) == 10 {
                    attack = string_copy(line, 1, string_length(attack) - 2);
                }*/
                
                var attack_id, delay;
                switch(attack) {
                    case "line_left":
                        attack_id = 0;
                        delay = global.lifetime[0];
                        break;
                    case "line_right":
                        attack_id = 1;
                        delay = global.lifetime[0];
                        break;
                    case "aimed_left":
                        attack_id = 2;
                        delay = global.lifetime[1];
                        break;
                    case "aimed_right":
                        attack_id = 3;
                        delay = global.lifetime[1];
                        break;
                    case "aimed_middle":
                        attack_id = 10;
                        delay = global.lifetime[1];
                        break;
                    case "rise_left":
                        attack_id = 4;
                        delay = global.lifetime[2];
                        break;
                    case "rise_middle":
                        attack_id = 5;
                        delay = global.lifetime[2];
                        break;
                    case "rise_right":
                        attack_id = 6;
                        delay = global.lifetime[2];
                        break;
                    case "bonus":
                        attack_id = 7;
                        delay = global.lifetime[3];
                        break;
                    case "circle_left":
                        attack_id = 8;
                        delay = global.lifetime[4];
                        break;
                    case "circle_right":
                        attack_id = 9;
                        delay = global.lifetime[4];
                        break;
                    case "end":
                        attack_id = 11;
                        delay = 0;
                        break;
                    default:
                        attack_id = -1;
                        break;
                }
                var time = floor((beat + bit / global.bits) * 3000 / global.bpm + 0.5) + global.offset - delay;
                data[# i, 0] = time;
                data[# i, 1] = attack_id;
                data[# i, 2] = spawn;
                
                i++;
            }
        }
    file_text_close(file);
}

return data;
