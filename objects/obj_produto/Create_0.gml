/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//meu level
level = 0;
timer = 0;

//defininindo se posso fazer
fazer = false;

if( array_length(global.managers) <= indice)
{
	tenho_manager = global.managers[indice];
}
else
{
	array_push(global.managers, 0 );
	tenho_manager = 0;
}

// meus custos
custo = custo_base;

comprado = false;
efeito_comprar = false;

lucro = lucro_base;

//me inserindo na lista de produro
global.produtos[indice] = id;

incremento = 1.07;

comprar = function()
{
	global.gold -= custo;
	comprado = true;	
	//aumentando o custo
	
	var _custo_atual = floor(custo_base * (power(incremento, level)));
	
	custo += _custo_atual;
	level++;
	
	lucro = lucro_base * level;
}

acao = function()
{
	timer = 0;
	fazer = tenho_manager;
	//dandop lucro
	global.gold += lucro;
}

//desenhando o produto
desenha_produto = function()
{
	//me desenhando
	draw_self();
	draw_set_font(fnt_texto);
	//desenhando o produto a minha esquerda
	draw_sprite(spr_item,indice ,x,y - 16);
	
	//alinghando meu texto
	draw_set_valign(1);
	draw_set_halign(1);
	
	//desenhando o meu level
	var _x = x;
	var _y = y + 24;
	draw_ellipse_color(_x - 24, _y - 16, _x + 24, _y + 16, c_dkgray, c_dkgray,false);
	draw_text(_x, _y, level);
	
	//desenhando barra de progresso 
	var _x1 = x + 42;
	var _y1 = y - 32;
	var _larg = sprite_width / 1.2;
	var _x2 = _x1 + _larg;
	var _y2 = _y1 + sprite_height / 4;
	//desenhando fundo da barra 
	draw_rectangle_color(_x1 - 1, _y1 -1, _x2 + 1, _y2 + 1, c_black, c_black, c_black, c_black , false)
	draw_rectangle_color(_x1, _y1, _x2, _y2, c_gray, c_gray, c_gray, c_gray , false)
	var _progresso = (timer / tempo) * _larg;
	draw_rectangle_color(_x1, _y1, _x1 + _progresso, _y2, c_green, c_green, c_green, c_green , false)
	//desenhando o quanto eu rendo 
	draw_set_halign(2);
	var _str = convert_num(lucro);
	draw_text(_x2 - 10,_y1 + sprite_height / 8, _str);
	draw_set_halign(1);
	
	//desenhando o meu preco
	_x1 = x + 42;
	_y1 = y + 8;
	var _larg = sprite_width / 5
	_x2 = _x1 + _larg;
	_y2 = _y1 + 32;
	var _cor = global.gold >= custo ? c_green : c_grey;
	var _str = convert_num(custo);
	if (efeito_comprar)
	{
		draw_rectangle_color(_x1 - 1, _y1 -1, _x2 + 1, _y2 + 1, c_black, c_black, c_black, c_black , false);
	}
	draw_rectangle_color(_x1, _y1, _x2, _y2, _cor, _cor, _cor, _cor, false );
	draw_text_transformed(_x1 + _larg/2, _y1 + 16, _str, 1,1,0 );
	
	//desenhando o tempo que leva
	var _s = floor((tempo - timer) % 60);
	var _m = ((tempo - timer) div 60) % 60;
	var _h = ((tempo - timer) div 60) div 60;
	draw_set_halign(2);
	
	var _seg = _s > 9 ? _s : "0" + string(_s);
	var _min = _m > 9 ? _m : "0" + string(_m);
	var _hor = _h > 9 ? _h : "0" + string(_h);
	draw_text(x + sprite_width - 24 , _y1 + 16, string("{0}:{1}:{2}", _hor, _min, _seg))
	
	
	draw_set_halign(1);
	
	draw_set_valign(-1);
	draw_set_halign(-1);
	
	
	if (efeito_comprar)
	{
		exibe_info();
	}
	draw_set_font(-1);
	
	
}


//exibindo as informacoes do produto
exibe_info = function()
{
	var _x1 =  x + sprite_width + 12;
	var _y1 = y - sprite_height/2;
	var _marg = 10;
	
	draw_sprite_stretched(spr_info,0,_x1, _y1, sprite_width, sprite_height);
	
	draw_text(_x1 + _marg, _y1 + _marg, nome);
	
	draw_text_ext(_x1 + _marg, _y1 + 30 , descricao, 20,  sprite_width - _marg * 2);
	
}




















