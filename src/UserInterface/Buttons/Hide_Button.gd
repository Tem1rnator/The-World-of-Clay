extends Button_Class

signal Button_up

func button_up() -> void:
	if hold:
		emit_signal("Button_up")
		hold = false
		#print("button up")
