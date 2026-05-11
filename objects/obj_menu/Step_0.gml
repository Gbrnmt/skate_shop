// --- Configuração de Espaçamento ---
var option_spacing = room_height * 0.15; 
var extra_space_second = room_height * 0.05; 
var option_start_y = (room_height - (array_length(menu_options) * option_spacing + extra_space_second)) / 2;

var clicked = false;

// --- Verificação de Mouse ---
for (var i = 0; i < array_length(menu_options); i++) {
    // Calcula a posição Y exata da opção atual
    var option_y = option_start_y + i * option_spacing;
    if (i == 1) option_y += extra_space_second;

    // Define a largura e altura da área de colisão (hitbox)
    var txt_w = string_width(menu_options[i]);
    var txt_h = string_height(menu_options[i]);
    
    var option_x1 = (room_width - txt_w) / 2;
    var option_x2 = option_x1 + txt_w;
    var option_y1 = option_y;
    var option_y2 = option_y + txt_h;

    // Se o mouse estiver sobre o texto
    if (mouse_x > option_x1 && mouse_x < option_x2 && mouse_y > option_y1 && mouse_y < option_y2) {
        selected_option = i; // Destaca a opção
        
        // Verifica o clique do mouse
        if (mouse_check_button_pressed(mb_left)) {
            clicked = true;
        }
    }
}

// --- Execução das Ações ---
if (clicked) {
    switch (selected_option) {
        case 0: // Iniciar Jogo
            global.game_running = true;
            room_goto(Room1);
            instance_destroy();
            break;
            
        case 1: // Sair
            game_end();
            break;
    }
}