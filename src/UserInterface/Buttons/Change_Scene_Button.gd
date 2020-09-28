#tool
extends Button_Class

export(String, FILE) var next_scene_path: = ""

func button_up() -> void:
	#print(hold)
	if hold:
		get_tree().change_scene(next_scene_path)
		hold = false
		#print("button up")

func _get_configuration_warning() -> String:
	return "next_scene_path must be set for the button to work" if next_scene_path == "" else ""
