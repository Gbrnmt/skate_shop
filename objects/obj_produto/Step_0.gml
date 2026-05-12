/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (comprado)
{
	if (fazer)
	{
		timer += global.framerate;

		if (timer > tempo)
		{
			acao();
				
		}
	}
}

//checando se o mouse esta por cima do manger
mouse_manager = point_in_rectangle(mouse_x, mouse_y, x + sprite_width, y - 22,  x + sprite_width + 44, y + 22);


var _mouse_sobre = position_meeting(mouse_x - meu_x, mouse_y - meu_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);

if(mouse_manager)
{
	if(_mouse_click)
	{
		if (!tenho_manager)
		{
			if (global.gold >= valor_manager)
			{
				//comprando o manager 
				tenho_manager = true;
				global.gold -= valor_manager;
				fazer = true;
				
			}
		}
	}
}

if (_mouse_sobre)
{
	image_index = 1;
	infos = true;
	if(_mouse_click)
	{
		fazer = true;
	}
	var _x1 = x + 54;
	var _y1 = y - 2;
	var _x2 = _x1 + 42;
	var _y2 = _y1 + 16;
	var _mouse_caixa = point_in_rectangle(mouse_x - meu_x, mouse_y - meu_y, _x1, _y1 , _x2, _y2 )
	efeito_comprar = _mouse_caixa;
	if (_mouse_caixa)
	{
		if (_mouse_click)
		{
			if (global.gold >= custo)
			{
				comprar();
			}
		}
	}
	
}
else
{
	infos = false;
	efeito_comprar = false;
	image_index = 0;
}


