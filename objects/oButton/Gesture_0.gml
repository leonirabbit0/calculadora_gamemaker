animando = true;
offset_y = 16;

if instance_exists(oCpu) {
	if number_ >= 0 {
		oCpu.valor2 = (oCpu.valor2 * 10) + number_
		oCpu._string_da_tela = oCpu.valor2
		
		if oCpu.ultimo_operador == "-" {
			oCpu.valor2 = -oCpu.valor2
		}
		
		if oCpu.ultimo_operador == "." {
			
			
		}
		
		
	}
	else {
		if oCpu.ultimo_operador != "*" && operator_ == "*" && oCpu.ultimo_operador != "" {
			var retorno = equals(oCpu.valor1, oCpu.valor2, oCpu.ultimo_operador)
			
			show_debug_message(retorno)
			
			array_push(oCpu.historico, retorno[1])
			oCpu.valor2 = 0
			oCpu.valor1 = retorno[0]
			
			oCpu.ultimo_operador = "*"
			oCpu.top_text = retorno[1]
		}

		else {
			if oCpu.ultimo_operador != "/" && operator_ == "/" && oCpu.ultimo_operador != ""{
			var retorno = equals(oCpu.valor1, oCpu.valor2, oCpu.ultimo_operador)
			array_push(oCpu.historico, retorno[1])
			show_debug_message(retorno)
			oCpu.valor2 = 0
			oCpu.valor1 = retorno[0]
			
			oCpu.ultimo_operador = "/"
			oCpu.top_text = retorno[1]
			
			} else {
				if operator_ != "Delete" {
					oCpu.top_text = handle_operators(operator_)
					oCpu._string_da_tela = $"0"	
				}
				else {
					oCpu._string_da_tela = handle_operators(operator_)	
				}
			}
		}
	}
}


function inserir_historico(valor1, valor2) {
	array_push(oCpu.historico, $"{valor1}+{valor2}=${valor1 + valor2}")
}

function handle_operators (operator) {
	var ultimo_operador = oCpu.ultimo_operador
	var operadores = oCpu.operadores


	
	switch operator {
		case "CE":
			oCpu.valor1 = 0
			oCpu.valor2 = 0
			oCpu.ultimo_operador = ""
			return "0"
			
		case "C":
			oCpu.valor2 = 0
			return $"{oCpu.valor1}{ultimo_operador}"
			
		case "+":
			oCpu.valor1 += oCpu.valor2
			oCpu.valor2 = 0
			
			oCpu.ultimo_operador = "+"
			return $"{oCpu.valor1}+"
			
		case "-":
			oCpu.valor1 = oCpu.valor1 + oCpu.valor2
			oCpu.valor2 = 0
			
			oCpu.ultimo_operador = "-"
			return $"{oCpu.valor1}-"
			
			// 5 + 13 * 36
		case "*":
			if oCpu.valor1 == 0 and oCpu.valor2 != 0  {
				oCpu.valor1 = oCpu.valor2
			}
			else {
				oCpu.valor1 = oCpu.valor1 * oCpu.valor2
			}
			
			oCpu.valor2 = 0
			oCpu.ultimo_operador = "*"
			
			return $"{oCpu.valor1}*"
			
		case "/":
			
			if oCpu.ultimo_operador == "/" {
				oCpu.valor2 = 0
				return $"{oCpu.valor1}/"
			}
			
			if oCpu.valor1 == 0  {
				oCpu.valor1 = oCpu.valor2
			}
			
			else {
				oCpu.valor1 = oCpu.valor1 / oCpu.valor2
			}
			
			oCpu.valor2 = 0
			
			oCpu.ultimo_operador = "/"
			
			return $"{oCpu.valor1}/"
			
		case "=":
		
			if ultimo_operador == "=" or ultimo_operador == "" {
				return oCpu.valor2
			}
			
			var retorno = equals(oCpu.valor1, oCpu.valor2, ultimo_operador)
			
			show_debug_message(retorno)
			array_push(oCpu.historico, retorno[1])
			oCpu.valor2 = 0
			oCpu.valor1 = retorno[0]
			
			oCpu.ultimo_operador = "="
			return  retorno[1]
			
			
		case "Delete":
			var resto = oCpu.valor2 div 10
			oCpu.valor2 = resto
			oCpu.ultimo_operador = ""
			return $"{resto}"
			
			
		case ".":
			
			if oCpu.ultimo_operador == "." {
				return $"{oCpu._string_da_tela}"
				
			}
			oCpu.ultimo_operador = "."
			return $"{oCpu._string_da_tela}."
		
	}
}



function executar_operacao_pendente(operador) {
	if operador != "" {
		oCpu._numero_da_tela = handle_operators(operador)
		oCpu.ultimo_operador = ""
	}
}

