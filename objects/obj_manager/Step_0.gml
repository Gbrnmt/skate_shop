/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);

if (_mouse_sobre && comprado == false)
{
	if(_mouse_click)
	{
		if (global.gold >= custo)
		{
			global.gold -= custo;
			
			global.managers[indice] = true;
			comprado = true;
			
			global.produtos[indice].fazer = true;
			global.produtos[indice].tenho_manager = true;
		}
	}
}