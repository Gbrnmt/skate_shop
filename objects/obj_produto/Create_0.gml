/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//meu level
level = 0;
level_upgrade = 100;

produtividade = 1;

nome = global.struct_produtos[indice].nome;
descricao = global.struct_produtos[indice].descricao;
custo_base = global.struct_produtos[indice].custo_base;
lucro_base = global.struct_produtos[indice].lucro_base;
tempo_base = global.struct_produtos[indice].tempo;
tempo = tempo_base;

valor_manager =custo_base * 100;
//upgrade





timer = 0;


meu_x = 0;
meu_y = 0;
//defininindo se posso fazer
fazer = false;
infos = false;
tenho_manager = false;

// meus custos
custo = custo_base;

comprado = false;
efeito_comprar = false;

lucro = lucro_base;
mouse_manager = false;

//me inserindo na lista de produro
global.produtos[indice] = id;

incremento = 1.07;

comprar = function()
{
    if (global.gold >= custo)
    {
        global.gold -= custo;
        comprado = true;

        level++;
		
		if (level == level_upgrade)
		{
			level_upgrade *= 2.5;
			produtividade *= 2;
			tempo = tempo_base / produtividade;
		}

        // custo sobe MUITO mais rápido
        custo = floor(custo_base * power(incremento, level * 1.35));

        // lucro cresce mais devagar
        lucro = floor(lucro_base * power(level, 0.85));
    }
}

ajusta_infos = function()
{
    lucro = floor(lucro_base * power(level, 0.85));
    custo = floor(custo_base * power(incremento, level * 1.35));
	
	if (level == level_upgrade)
		{
			level_upgrade *= 2.5;
			produtividade *= 2;
			tempo = tempo_base / produtividade;
		}

    if (comprado && tenho_manager)
    {
        fazer = true;
    }
}

acao = function()
{
    timer = 0;
    fazer = tenho_manager;

    // ganha ouro
    global.gold += lucro;
}

//desenhando o produto
desenha_produto = function()
{
	//me desenhando
	draw_self();
	draw_set_font(fnt_texto);
	
	//desenhando o item
	draw_sprite(spr_doces,indice,x + 8, y - 20);
	//alinghando meu texto
	draw_set_valign(1);
	draw_set_halign(1);
	
	draw_set_color(c_white);
	//desenhando o level
	var _txt = string("{0}/{1}",level, level_upgrade);
	draw_text_transformed(x + 22, y + 12, _txt, .5, .5, 0);
	
	//desenhando o meu level
	var _x = x;
	var _y = y + 24;

	//desenhando barra de progresso 
	var _x1 = x + 53;
	var _y1 = y - 13;
	var _larg = 90;
	var _x2 = _x1 + _larg;
	var _y2 = _y1 + sprite_height / 4;
	var _progresso = (timer / tempo) * _larg;
	//desenhando a barra
	draw_sprite(spr_barra_temp,1,_x1 , _y1);
	
	//desenhando o prodresso
	draw_sprite_part(spr_barra_temp,0, 0, 0, _progresso, 9, _x1, _y1)
	
	draw_set_halign(2);
	var _str = convert_num(lucro);
	
	draw_set_halign(1);
	
	//desenhando o meu preco
	_x1 = x + 54;
	_y1 = y - 2;
	var _larg = sprite_width / 2;
	_x2 = _x1 + _larg;
	_y2 = _y1 + 32;
	var _cor = global.gold >= custo ? c_green : c_grey;
	
	//se eu tenho dinheiro´para comprar
	var _image = global.gold >= custo ? efeito_comprar + 1 : 0;
	
	
	var _str = convert_num(custo);
	
	//botao de comprar
	draw_sprite(spr_botao7, _image, _x1, _y1);
	
	//desenhando o custo
	draw_text_transformed(x + 74, y + 6, _str, .4, .4, 0 );
	
	if (efeito_comprar)
	{
	
	}
	
	//desenhando o espaço do manager
	if(!tenho_manager)
	{
		draw_sprite(spr_caixa_info2, mouse_manager, x + sprite_width, y);
		//desenhando o preco do meu custo
		draw_text_ext_transformed( x + sprite_width + 21, y, convert_num(valor_manager),20,44, .5, .5, 0)
	}
	else
	{
		draw_sprite(spr_gerentes_gatos,indice, x + sprite_width, y);
	}
	
	
	
	
	//desenhando o tempo que leva
	var _s = round((tempo - timer) % 60);
	var _m = ((tempo - timer) div 60) % 60;
	var _h = ((tempo - timer) div 60) div 60;
	draw_set_halign(2);
	
	var _seg = _s > 9 ? _s : "0" + string(_s);
	var _min = _m > 9 ? _m : "0" + string(_m);
	var _hor = _h > 9 ? _h : "0" + string(_h);
	_str = string("{0}:{1}:{2}", _hor, _min, _seg);
	
	draw_text_transformed(x + 143,y + 6, _str, .6, .6, 0)
	
	draw_set_halign(1);
	
	draw_set_valign(-1);
	draw_set_halign(-1);
	
	
	if (infos)
	{

		exibe_info();
		
	}
	draw_set_color(-1)
	draw_set_font(-1);
	
	
}


//exibindo as informacoes do produto
exibe_info = function()
{
	var _x1 =  115;
	var _y1 = 270;
	var _marg = 12;
	draw_set_font(fnt_exibicao);
	draw_set_halign(0)
	draw_set_valign(1)
	//draw_sprite_stretched(spr_info,0,_x1, _y1, sprite_width, sprite_height);
	//gpu_set_colourwriteenable(1, 1, 1, 0);
	draw_text_transformed(_x1 + _marg, _y1 + _marg, nome, .2, .2, 0);
	
	//descricao

	draw_text_ext_transformed(

    _x1 + _marg,

    _y1 + _marg + 15,

    descricao,

    120, // largura máxima antes de quebrar

    -1,

    0.2,

    0.2,

    0

);
	
	//draw_text_ext(_x1 + _marg, _y1 + 30 , descricao, 20,  sprite_width - _marg * 2);
	draw_set_font(-1);
	draw_set_halign(-1)
	draw_set_valign(-1)
	//gpu_set_colourwriteenable(1, 1, 1, 1);
	
}
if (global.produtos_info[indice] != 0)
{
	level = global.produtos_info[indice].level;
	comprado = global.produtos_info[indice].comprado;
	tenho_manager = global.produtos_info[indice].tenho_manager;
	level_upgrade = global.produtos_info[indice].level_upgrade;
	produtividade = global.produtos_info[indice].produtividade;
	tempo = tempo_base / produtividade;
	ajusta_infos();
}




















