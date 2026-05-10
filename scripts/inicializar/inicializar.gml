// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

//configurando tempo do jogo
#macro FRAMERS 60
game_set_speed(FRAMERS, gamespeed_fps);

//usando deltatime para ajusta o tempo do jogo
global.game_spd = 1;
//definindo o framerate
global.framerate = global.game_spd / FRAMERS;
//identificando a duracao de um segundo no jogo 
global.gamesegundos = 0;

//funcao para atualizar o tempo do jogo
function atualiza_tempo()
{
	global.gamesegundos = delta_time / 1000000;
	global.framerate = global.gamesegundos * global.game_spd;
}

global.exibe_managers = false;

//variaveis de dinheiro
global.gold = 4;

//guardando qm e meu manager
global.managers = [0, 0, 0, 0, 0, 0, 0, 0]

//lista dos produtod 
global.produtos = [0, 0, 0, 0, 0, 0, 0, 0]


//abrindo omeu jason
var _file = file_text_open_read("dados.json");
var _txt = "";
while (true)
{
	if (file_text_eof(_file))
	{
		break;
	}
	else
	{
		var _linha = file_text_readln(_file);
		_txt += _linha;
	}
}
global.struct_produtos = json_parse(_txt).items;






