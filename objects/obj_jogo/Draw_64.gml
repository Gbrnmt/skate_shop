/// @description Inserir descrição aqui
// Você pode escrever seu código neste edi]


//desenhando a grana
var _n = 1;
var _alt = 20;
draw_set_halign(0);
var _str = convert_num(global.gold);
//draw_text(20, _alt * _n++, _str);
draw_set_halign(-1);


//eu quero saber o quanto eu ganho por segundo 
var _dinheiro_seg = 0;

//descobrindo
for (var i = 0; i < array_length(global.produtos); i++)
{
	if (global.produtos[i] != 0)
	{
		var _atual = global.produtos[i];
		with(_atual)
		{
			if (tenho_manager && comprado)
			{
				_dinheiro_seg += (lucro / tempo);
			}
		}
	}
}

//desenhando o gold
draw_set_font(fnt_exibicao);
draw_set_halign(1)
draw_set_valign(1)
draw_text_transformed(gui_larg / 2, 70, _str, .5,.5, 0);

global.gold_seg = _dinheiro_seg
var _str = convert_num(global.gold_seg) + "/s";
draw_text_transformed(gui_larg / 2, 100, _str, .3,.3, 0);


//draw_text(20, _alt * _n++, _str);
draw_set_font(-1);
draw_set_halign(-1)
draw_set_valign(-1)













