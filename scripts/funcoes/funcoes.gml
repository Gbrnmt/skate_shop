


function convert_num(_num)
{

    //Retornando a string arrumadinha já
    var _custo2 = _num;
    var _valores = ["", "K", "M", "B", "T", "Q"];
    var _i = 0;

    //Sempre que o valor for maior do que 1000, eu tiro 3 zeros dele
    while(_custo2 > 1000)
    {

        //Tiro 3 zeros dele
        _custo2 /= 1000;

        //Sempre que eu rodei isso, eu subo para a próxima casa
        _i++;
    }

    var _str2 = "R$ " + string_format(_custo2, 0, 2) + _valores[_i];

    return _str2;
}

//salvando o jogo
function save_game()
{
	
	var _file = file_text_open_write("save.json");
	
	//criando um vertor par saber q	uantos produtos eu tenho
	var _qtd_prod = array_create(array_length(global.produtos), 0);
	
	var _salvar_dados = function(_elemento, _indice)
	{
		if(instance_exists(global.produtos[_indice]))
		{
		
			_elemento =
			{
			//pégando as informacoes
			comprado : global.produtos[_indice].comprado,
			level	 : global.produtos[_indice].level,
			tenho_manager : global.produtos[_indice].tenho_manager,
			level_upgrade : global.produtos[_indice].level_upgrade,
			produtividade : global.produtos[_indice].produtividade,
			};
			return _elemento;
		}
	}
	
	var _produtos = array_map(_qtd_prod, _salvar_dados);
	
	var _tempo_atual = date_current_datetime();
	
	var _struct =
	{
		gold : global.gold,
		produtos : _produtos,
		gold_seg : global.gold_seg,
		tempo : _tempo_atual
		
	};
	
	var _string = json_stringify(_struct);
	
	file_text_write_string(_file, _string);
	
	file_text_close(_file);
}

//caregando o jogogo
function load_game()
{
	if(file_exists("save.json"))
	{
		var _file = file_text_open_read("save.json");
	
	
		var _string = file_text_read_string(_file);
	
		var _struct = json_parse(_string);
	
		global.gold = _struct.gold;

		//passando a informacoes do produto para o jogo
		global.produtos_info = _struct.produtos;
		
		var _tempo = date_current_datetime();
		var _dif = date_second_span(_struct.tempo, _tempo);
		var _dinheiro_feito = _dif * _struct.gold_seg;
		var _str = convert_num(_dinheiro_feito);
		
		global.gold += _dinheiro_feito;
		
		
	
		file_text_close(_file);
	}
}


















