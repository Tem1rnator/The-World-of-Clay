extends Button
class_name Button_Class

#signal Button_up
var hold := false
var width = ProjectSettings.get_setting("display/window/size/width")
var height = ProjectSettings.get_setting("display/window/size/height")
onready var parent_node = get_node("../")
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
		var glob_pos = get_global_position()
		#var x_scale_expresion = rect_size.x * parent_node.get_scale() * get_scale().x
		#var y_scale_expresion = rect_size.y * parent_node.get_scale() * get_scale().y
		
		var x_statement = mouse_pos.x < glob_pos.x or glob_pos.x + rect_size.x < mouse_pos.x # * get_scale().x < mouse_pos.x
		#print(mouse_pos.x, " ", rect_position.x, " ", rect_size.x)
		var y_statement = mouse_pos.y < glob_pos.y or glob_pos.y + rect_size.y < mouse_pos.y # * get_scale().y < mouse_pos.x
		#print(x_statement, y_statement)
		if x_statement or y_statement:
			#print("hold = false")
			hold = false
