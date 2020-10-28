#tool      #Be very careful
extends HBoxContainer

onready var tabs = get_children()
#var tabs_control = []
var valid := true
var current_child_count: int = get_child_count()

export (int) var current_tab := 0 setget set_current_tab
#var tab_window_name := "tab_window"

"""func _ready() -> void:
	for i in range(len(tabs)):
		if i == current_tab:
			continue
		tabs_control.append(true)"""


func find_current_tab(tab_name: String) -> int:
	var count := 0
	for tab in tabs:
		if tab.name == tab_name:
			break
		count += 1
	#If can't find, raise error
	return count

func set_current_tab(value: int) -> void:
	#print(tabs)
	tabs[current_tab].get_child(0).visible = false
	valid = false
	#tabs_control[current_tab] = true
	tabs[current_tab].pressed = false
	#emit_signal("toggle", false, current_tab_name, false)
	#tabs[current_tab].emit_signal("toggled", false, current_tab_name, false)
	#print("awd")
	current_tab = value
	#tabs_control[current_tab] = false
	tabs[current_tab].pressed = true
	tabs[current_tab].get_child(0).visible = true

"""func _process(_delta: float) -> void:
	if Engine.editor_hint:
		if get_child_count() > current_child_count:
			
			var updated_children = get_children()
			var updated_child_count = get_child_count()
			var new_children = []
			var new_child_count = updated_child_count - current_child_count
			
			
			for i in range(updated_child_count):
				var found := false
				for j in range(updated_child_count):
					print(j)
					if updated_children[i] == updated_children[j] and i != j:
						found = true
				if found:
					new_children.append(updated_children[i])
					print("lol")
			
			for i in range(new_child_count):
				#If "current child_count" < 0, throw an error
				if current_child_count == 0:
					break
				new_children[i].toggle_mode = true
				new_children[i].connect("toggled", self, "on_tab_toggled", [new_children[i].name])
				new_child_count -= 1
			tabs = updated_children"""


func _on_tab_toggled(_button_pressed: bool, tab_name: String) -> void:
	#print(tab_name)
	if not valid:
		valid = true
	else:
		var _cur_tab = find_current_tab(tab_name)
		#tabs_control[_cur_tab] = false
		if _cur_tab == current_tab:
			valid = false
			tabs[_cur_tab].pressed = true
		else:
			self.current_tab = _cur_tab
			print("succed!")
		#elif _cur_tab == current_tab:
		#	tabs[current_tab].pressed = true


func _on_tab_renamed() -> void:
	pass # Replace with function body.
