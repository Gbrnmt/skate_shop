/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
comprado = global.managers[indice];
meu_y = 0;
meu_x = 0;
desenha_manager = function()
{
	draw_self();
	//desenhando o meu custo
	draw_set_halign(1);
	draw_set_valign(1);
	var _str = convert_num(custo)
	var	_txt = comprado == true ? "vendido!!!!" : _str;
	gpu_set_colourwriteenable(1,1,1, 0);
	draw_text(x + sprite_width / 2, y, _txt);
	gpu_set_colourwriteenable(1,1,1, 1);
	draw_set_halign(-1);
	draw_set_valign(-1);
}