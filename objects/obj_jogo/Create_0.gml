/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//lista dos produtos
produtos = [];
managers = [];
//dados da surfce dos produtos

surf_prod = noone;
prod_w	  = 860;
prod_h    = 500;
prod_x    = 48;
prod_y    = 48;
//dados da surfce dos managers
surf_man = noone;
man_w	 = 360;
man_h_base = 500;
man_h    = 1;
man_x    = 880;
man_y    = 48;


base_y = 80
produtos_y = 0 + base_y;

cria_produtos = function(_qtd = 1)
{
	for ( var i = 0; i < _qtd; i++)
	{
		//meus dados 
		var _struct = global.struct_produtos[i];
		
		produtos[i] = instance_create_layer(0, 0, layer, obj_produto, _struct);
	}
}


cria_managers = function()
{
	for ( var i = 0; i < array_length(produtos); i++)
	{
		var _meu_produto 
		managers[i] = instance_create_layer(900, 100 + i * 100, layer, obj_manager)
		
		managers[i].custo = global.produtos[i].custo_base * 10;
		managers[i].indice = i;
		
	}
}


rolagem = function(_val = 10, _x = 0, _y = 0, _w = 0, _h = 0 )
{
	var _qtd = 0;
	var _fazer = false;	
	
	if (_w != 0 )
	{
		_fazer = point_in_rectangle(mouse_x, mouse_y, _x, _y, _x + _w,_y + _h);
	}
	else
	{
		
	}
	if(_fazer)
	{
		if (mouse_wheel_up())
		{
			_qtd = _val;
		}
		if(mouse_wheel_down())
		{
			_qtd = - _val;
		}
	}
	
	 return _qtd
} 
gerencia_managers = function()
{
	static _meu_y = 0;
	var _alt = sprite_get_height(spr_produto);
	var _larg = sprite_get_width(spr_produto);
	var _marg = 20;
	_meu_y += rolagem(30, man_x, man_y, man_w, man_h);
	
	var _qtd = array_length(managers);
	var _max = (_alt * _qtd) + (_marg * _qtd) + _marg - prod_h;
	
	_meu_y = clamp(_meu_y, -_max, 0)
	
	for (var i = 0; i < _qtd; i++)
	{
		var _x = 0;
		var _y = _meu_y + _marg + ((i * _alt) + (i * _marg));
		
		with(managers[i])
		{
			x = _x;
			y = _y + sprite_height/2;
		}
		
	}

	
}

gerencia_produtos = function()
{
	static _meu_y = 0;
	var _alt = sprite_get_height(spr_produto);
	var _larg = sprite_get_width(spr_produto);
	var _marg = 20;
	_meu_y += rolagem(30, prod_x, prod_y, prod_w/2, prod_h);
	
	var _qtd = array_length(produtos);
	var _max = (_alt * _qtd) + (_marg * _qtd) + _marg - prod_h;
	
	_meu_y = clamp(_meu_y, -_max, 0)
	
	for (var i = 0; i < array_length(produtos); i++)
	{
		var _x = 24;
		var _y = _meu_y + _marg + ((i * _alt) + (i * _marg));
	
		with(produtos[i])
		{
			x = _x;
			y = _y + sprite_height/2;
		}
	}
}


desenha_managers = function()
{
	
	if(global.exibe_managers)
	{
		man_h = lerp(man_h, 500, .1)
	}
	else
	{
		man_h = lerp(man_h, 1, .1)
	}
	
	if(surface_exists(surf_man))
	{
		surface_set_target(surf_man);
		draw_clear_alpha(c_black, 0);
		
		draw_rectangle_color(0, 0, man_w, man_h, c_black, c_black, c_black, c_black, false)
		if (man_h > 3)
			{
			with(obj_manager)
			{
				desenha_manager();
				meu_x = other.man_x;
				meu_y = other.man_y;
			}
		}
		
		surface_reset_target();
		
		draw_surface(surf_man, man_x, man_y);
		
		surface_resize(surf_man, man_w, man_h);
	}
	else
	{
		surf_man = surface_create(man_w, man_h_base);
	}
}

//criando a surfaze dos produtos
desenha_produtos = function()
{
	
	if(surface_exists(surf_prod))
	{
		surface_set_target(surf_prod);
		draw_clear_alpha(c_black, 0);
		
		//draw_rectangle_color(0, 0, prod_w, prod_h, c_black, c_black, c_black, c_black, false)
		
		with(obj_produto)
		{
			desenha_produto();
			meu_x = other.prod_x;
			meu_y = other.prod_y;
		}
		
		
		
		surface_reset_target();
		
		draw_surface(surf_prod, prod_x, prod_y);
	}
	else
	{
		surf_prod = surface_create(prod_w, prod_h);
	}
	
	
}




cria_produtos(array_length(global.struct_produtos));
cria_managers();