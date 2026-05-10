/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//lista dos produtos
produtos = [];

//dados da surfce dos produtos

surf_prod = noone;
prod_w	  = 860;
prod_h    = 500;
prod_x    = 48;
prod_y    = 48;



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


rolagem = function(_val = 10)
{
	var _qtd = 0;
	if (mouse_wheel_up())
	{
		_qtd = _val;
	}
	if(mouse_wheel_down())
	{
		_qtd = - _val;
	}
	return _qtd;
}

gerencia_produtos = function()
{
	static _meu_y = 0;
	var _alt = sprite_get_height(spr_produto);
	var _larg = sprite_get_width(spr_produto);
	var _marg = 20;
	_meu_y += rolagem(30);
	
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