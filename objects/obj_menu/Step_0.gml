// --- Configuração de Espaçamento ---
var option_spacing = room_height * 0.15; 
var extra_space_second = room_height * 0.05; 
var option_start_y = (room_height - (array_length(menu_options) * option_spacing + extra_space_second)) / 2;

var clicked = false;

// --- 1. RESET DA SELEÇÃO ---
// Isso garante que se o mouse não estiver em cima de nada, o frame volte para 0
selected_option = -1; 

// --- Verificação de Mouse ---
for (var i = 0; i < array_length(menu_options); i++) {
    var option_y = option_start_y + i * option_spacing;
    if (i == 1) option_y += extra_space_second;

    // --- 2. HITBOX PELA SPRITE (Mais preciso para botões) ---
    // Usamos o tamanho da sprite para saber onde o mouse pode clicar
    var spr_w = sprite_get_width(spr_botao_menu);
    var spr_h = sprite_get_height(spr_botao_menu);
    
    // Se sua sprite tem origem no centro (Middle Center):
    var option_x1 = (room_width / 2) - (spr_w / 2);
    var option_x2 = (room_width / 2) + (spr_w / 2);
    var option_y1 = option_y - (spr_h / 2);
    var option_y2 = option_y + (spr_h / 2);

    // Se o mouse estiver sobre a área do botão
    if (mouse_x > option_x1 && mouse_x < option_x2 && mouse_y > option_y1 && mouse_y < option_y2) {
        selected_option = i; 
        
        if (mouse_check_button_pressed(mb_left)) {
            clicked = true;
        }
    }
}

// --- Execução das Ações ---
// Só executa se houve um clique E se existe uma opção selecionada (diferente de -1)
if (clicked && selected_option != -1) {
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