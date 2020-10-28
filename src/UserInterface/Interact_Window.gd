extends Control

onready var anim := $AnimationPlayer
var hidden := false

func _on_Hide_Button_Button_up() -> void:
	if not hidden:
		anim.play("Hide")
		hidden = true
	else:
		anim.play_backwards("Hide")
		hidden = false
