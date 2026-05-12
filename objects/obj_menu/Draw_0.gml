draw_set_font(fnt_texto);

// Fundo


draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
var title_y = room_height * 0.1;
draw_text_transformed(room_width / 2, title_y, "Skate Shop Empire", 2, 2, 0);

// Cálculos de espaçamento
var option_spacing = room_height * 0.10;
var extra_space_second = room_height * 0.1;
var total_menu_h = (array_length(menu_options) * option_spacing) + extra_space_second;
var option_start_y = (room_height - total_menu_h) / 2;

// Desenha as opções
for (var i = 0; i < array_length(menu_options); i++) {
    var option_y = option_start_y + i * option_spacing;
    if (i == 1) option_y += extra_space_second;

    var middle_x = room_width / 2;

    // Define o frame e a cor baseado na seleção
    var img_index = 0;
    var txt_col = c_grey;

    if (i == selected_option) {
        img_index = 1;
        txt_col = c_white;
    }

    // 1. Desenha a Sprite (Centralizada no middle_x)
    // Nota: Se a sprite ficar torta, mude o Origin da sprite para Middle Center no Editor
    draw_sprite_ext(spr_botao_menu, img_index, middle_x, option_y, 1, 1, 0, c_white, 1);

    // 2. Desenha o Texto (Centralizado no mesmo ponto da sprite)
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle); // Centraliza o texto verticalmente na linha
    draw_set_color(txt_col);
    
    draw_text(middle_x, option_y, menu_options[i]);
}

// Reseta padrões para não afetar outros objetos
draw_set_halign(fa_left);
draw_set_valign(fa_top);