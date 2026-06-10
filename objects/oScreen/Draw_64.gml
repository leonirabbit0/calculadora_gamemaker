draw_set_font(Scre)
draw_set_color(c_black)
draw_set_color(#658ad7)

var screen_width = sprite_get_width(sScreen) 
var screen_height = y
	
var x_numbers = 48 *  array_length(oCpu.dados)

var display_width = 640

var screen_end = x + screen_width - espacamento_padrao

var x_scale_ = 1
var y_scale_ = 1
/*
for (var i = 0; i < array_length(oCpu.dados); i+=1){
	draw_text(screen_end - 226, screen_height, oCpu.dados[i])
}
*/
draw_text(screen_end - 226, screen_height + 24, string(oCpu._string_da_tela))



draw_set_font(Scre_1)
draw_text(screen_end - 226, screen_height + 4, string(oCpu.top_text))



//show_debug_message(oCpu.dados)
//show_debug_message(oCpu._string_da_tela)
//show_debug_message(string_char_at(oCpu._string_da_tela, oCpu._string_indice))
/*
var a = "150"
*/



var historico_x = 360
var historico_y = 420

//draw_text(360, 32, $"valor1: {oCpu.valor1} \nvalor2:{oCpu.valor2} \n ")


if array_length(oCpu.historico) > 0 {
	for (var i= real(array_length(oCpu.historico)); i > 0; i--) {
		draw_text(historico_x, historico_y, $"{oCpu.historico[i-1]}")
		draw_sprite(sLinha, 0, historico_x, historico_y);
		historico_y -= 25
		if historico_y == 70 {
			break;	
		}
	}
	//draw_text(512, 30, $"{historico_y}")
}