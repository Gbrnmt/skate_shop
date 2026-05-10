


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