


function convert_num(_num, _dec = 2)
{
    // Se for 0, retorna logo formatado para evitar cálculos
    if (_num == 0) return "$0";
    
    var _valores = ["", "K", "M", "B", "T", "q", "Q", "s", "S"];
    var _ind = 0;
    var _temp_num = abs(_num); // Usamos o valor absoluto para o cálculo
    
    // Loop para encontrar o sufixo correto (K, M, B...)
    while (_temp_num >= 1000 && _ind < array_length(_valores) - 1) 
    {
        _temp_num /= 1000;
        _ind++;
    }
    
    // string_format(valor, total_de_caracteres, decimais)
    // Usar 0 no total_de_caracteres ajuda, mas não remove todos os espaços no GM
    var _str_val = string_format(_temp_num, 0, _dec);
    
    // REMOVE OS ESPAÇOS EM BRANCO (O pulo do gato para o $ aparecer)
    _str_val = string_trim(_str_val); 
    
    return "$" + _str_val + _valores[_ind];
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
			tenho_manager : global.produtos[_indice].tenho_manager
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


















