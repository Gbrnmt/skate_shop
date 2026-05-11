


function convert_num(_num, _dec = 2)
{
	if _num == 0 return string_format(_num, 0, _dec);
	
	var _valores = ["","K","M","B","T","q","Q","s","S"];
	var _n = floor(log10(_num));
	var _n2 = (_num / power(10,_n));
	var _ind = (_n div 3);
	var _res = (_n % 3);
	
	var _val = _n2 * (power(10, _res));
	var _str = "";
	var _notRound = 0.000;
	if (frac(_val) > 0) //Se houver valor decimal, ou seja se _val = 1049, tem valor decimal de .049
	{
		_notRound = 0.005; //Remove 0.005 do valor para ele arredondar para baixo
		_str = string_format(_val-_notRound, 0, _dec) + _valores[_ind];
	}
	else
	{
		_str = "$" + string_format(_val, 0, 0) + _valores[_ind];
	}
	
	return _str;
}

//salvando o jogo
function save_game()
{
	
	var _file = file_text_open_write("save.json");
	
	//criando um vertor par saber q	uantos produtos eu tenho
	var _qtd_prod = array_create(array_length(global.produtos), 0);
	
	var _salvar_dados = function(_elemento, _indice)
	{
		_elemento =
		{
		//pégando as informacoes
		comprado : global.produtos[_indice].comprado,
		level	 : global.produtos[_indice].level,
		tenho_manager : global.produtos[_indice].tenho_manager
		};
		return _elemento;
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


















