extends Button
class_name Button_Class

#signal Button_up
var hold := false
var width = ProjectSettings.get_setting("display/window/size/width")
var height = ProjectSettings.get_setting("display/window/size/height")
#Vector2(width + self.rect_position.x, height + self.rect_position.y)

func button_down() -> void:
	hold = true
	#print("button down")


"""func button_up() -> void:
	if hold:
		hold = false"""
		#print("button up")

func _process(_delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	#print(typeof(self.rect_size.x) == TYPE_BOOL)
	if hold:
		var x_statement = mouse_pos.x < self.get_global_position().x or self.get_global_position().x + self.rect_size.x < mouse_pos.x
		#print(mouse_pos.x, " ", self.rect_position, " ", self.rect_size.x)
		var y_statement = mouse_pos.y < get_global_position().y or self.get_global_position().y + self.rect_size.y < mouse_pos.y
		#print(x_statement, y_statement)
		if x_statement or y_statement:
			#print("hold = false")
			hold = false
