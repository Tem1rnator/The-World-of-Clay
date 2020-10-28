extends Button_Class

func button_up() -> void:
	if hold:
		get_tree().quit()
		hold = false
