/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//lista dos produtos
produtos = [];


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
	var _max = (_alt * _qtd) + (_marg * _qtd) + _marg - room_height;
	
	_meu_y = clamp(_meu_y, -_max, 0)
	
	for (var i = 0; i < array_length(produtos); i++)
	{
		var _marg = 20;
		var _x = 160;
		var _y = _meu_y + _marg + ((i * _alt) + (i * _marg));
	
		with(produtos[i])
		{
			x = _x;
			y = _y + sprite_height/2;
		}
	}
}

cria_produtos(array_length(global.struct_produtos));