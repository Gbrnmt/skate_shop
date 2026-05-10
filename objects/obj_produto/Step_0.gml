/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (comprado)
{
	if (fazer)
		{
			timer += global.framerate;

			if (timer > tempo)
			{
				timer = 0;
				fazer = tenho_manager;
				//dandop lucro
				global.gold += lucro;
				
			}
		}
}
var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);

if (_mouse_sobre)
{
	if(_mouse_click)
	{
		fazer = true;
	}
	var _x1 = x + 42;
	var _y1 = y + 8;
	var _x2 = _x1 + 64;
	var _y2 = _y1 + 32;
	var _mouse_caixa = point_in_rectangle(mouse_x, mouse_y, _x1, _y1 , _x2, _y2 )
	efeito_comprar = _mouse_caixa;
	if (_mouse_caixa)
	{
		if (_mouse_click)
		{
			if (global.gold >= custo)
			{
				global.gold -= custo;
				comprado = true;
				
				//aumentando o custo
				custo *= 2;
				level++;
				
				lucro = lucro_base * level;
			}
		}
	}
	
}
var _x1 = x + 42;
var _y1 = y + 8;
var _x2 = _x1 + 64;
var _y2 = _y1 + 32;
var _mouse_caixa = point_in_rectangle(mouse_x, mouse_y, _x1, _y1 , _x2, _y2 )
efeito_comprar = _mouse_caixa;
