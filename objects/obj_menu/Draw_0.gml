//draw_set_font(fnt_menu);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Desenho do título
draw_set_color(c_white);
var title = "Top down";
var title_x = (room_width - string_width(title)) / 2;
var title_y = room_height * 0.1; // 10% da altura da tela
draw_text(title_x, title_y, title);

// Espaçamento proporcional
var option_spacing = room_height * 0.15;
var extra_space_second = room_height * 0.05;
var option_start_y = (room_height - (array_length(menu_options) * option_spacing + extra_space_second)) / 2;

// Desenha as opções
for (var i = 0; i < array_length(menu_options); i++) {
    var option_y = option_start_y + i * option_spacing;
    if (i == 1) option_y += extra_space_second;

    var option_x = (room_width - string_width(menu_options[i])) / 2;

    if (i == selected_option) draw_set_color(c_white);
    else draw_set_color(c_grey);

    draw_text(option_x, option_y, menu_options[i]);
}