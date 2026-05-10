/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
comprado = global.managers[indice];

desenha_manager = function()
{
	draw_self();
	//desenhando o meu custo
	draw_set_halign(1);
	draw_set_valign(1);
	var _str = "$" + string_format(custo, 0, 2);
	var	_txt = comprado == true ? "vendido!!!!" : _str;
	draw_text(x + sprite_width / 2, y, _txt);
	draw_set_halign(-1);
	draw_set_valign(-1);
}