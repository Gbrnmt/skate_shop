/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
atualiza_tempo();

if (keyboard_check(vk_space))
{
	global.game_spd = 50
}
else
{
	global.game_spd = 1
}

if (keyboard_check(ord("L")))
{
	global.gold = 100000;
}

gerencia_produtos();
gerencia_managers();