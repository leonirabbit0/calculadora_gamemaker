
/*

function sprite_selector (valor) {
	
	switch	(valor) {
		
		case 1:
			return sScreenOne
		case 2:
			return sScreenTwo
		case 3:
			return sScreenThree
		case 4:
			return sScreenFour
		case 5:
			return sScreenFive
		case 6:
			return sScreenSix
		case 7:
			return sScreenSeven
		case 8:
			return sScreenEight
		case 9:
			return sScreenNine
		case 0:
			return sScreenZero
		case "+":
			return sScreenPlus
			
	}
}


function draw_screen(valores){
	var screen_width = sprite_get_width(sScreen) 
	var screen_height = y
	
	var x_numbers = 48 *  array_length(valores)
	
	var display_width = 640
	
	var screen_end = oScreen.x + screen_width
	
	var x_scale_ = 1
	var y_scale_ = 1
	
	var aux_valores_para_desenhar = oScreen.valores_para_desenhar


	for (var i = 0 ; i < array_length(valores); i += 1)
	{
		if typeof(valores[i]) == typeof("A") {
			if array_length(oScreen.valores_para_desenhar) > 0 {
				array_insert(oScreen.valores_para_desenhar, 0, sprite_selector(valores[i]))
			}
			else{
				oScreen.valores_para_desenhar[0] = sprite_selector(valores[i])	
			}
		}
		else {
			var valores_aux = valores[i]
			for (var j = 0; valores_aux > 0; j++) {
				oScreen.valores_para_desenhar[j] = sprite_selector(valores_aux mod 10)
				valores_aux = valores_aux div 10
			}
		}
		show_debug_message(dados)

		
		/*		
		if i > 4 {
			x_scale_ -= .1
			y_scale_ -= .1
			draw_sprite_ext(_sprite, _sprite, screen_end - x_numbers , y, x_scale_, y_scale_, 0, c_white, 1)
		}
		else{
			draw_sprite_ext(_sprite, _sprite, screen_end - x_numbers , y, x_scale_, y_scale_, 0, c_white, 1)
		}
		screen_end += 48
		
	}
}

*/

function equals(valor1, valor2, ultimo_operador) {
	var str_return = $"{valor1}{ultimo_operador} {valor2}"
	
	if valor2 < 0 {
		str_return = $"{valor1}{ultimo_operador}{valor2 * -1}"	
	}
	
	
	if ultimo_operador == "+" {
			valor1 += valor2
			valor2 = 0
					
			ultimo_operador = 0
			str_return += $"= {valor1}"
			
			return [valor1, str_return]
	}
	if ultimo_operador == "-" {
			valor2 *= -1
			valor1 -= valor2
			valor2 = 0
					
			ultimo_operador = 0
			str_return += $"= {valor1}"
			return [valor1, str_return]
	}
	if ultimo_operador == "*" {
			show_debug_message($"{valor1} // {valor2}")
			
			valor1 = valor2 * valor1
			valor2 = 0
					
			ultimo_operador = 0
			str_return += $"= {valor1}"
			return [valor1, str_return]
	}
	if ultimo_operador == "/" {
			valor1 /= valor2
			valor2 = 0
					
			ultimo_operador = 0
			str_return += $"= {valor1}"
			return [valor1, str_return]
	}
}
