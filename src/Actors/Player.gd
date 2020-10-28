extends KinematicBody2D

export (int) var max_speed := 400
#var speed := Vector2.ZERO
var dir := Vector2.ZERO
var inputs = {"ui_up": Vector2.UP,
				"ui_down": Vector2.DOWN,
				"ui_right": Vector2.RIGHT,
				"ui_left": Vector2.LEFT}
var checked_inputs = [false, false]
var change_directions = [true, true]
var velocity := Vector2.ZERO
var acceleration := 0.1
var friction := 0.05

func _physics_process(_delta: float) -> void:
	input()
	velocity = dir.normalized() * max_speed
	if velocity.length() > 0:
		velocity = velocity.linear_interpolate(velocity,  acceleration)
	else:
		velocity = velocity.linear_interpolate(Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)

func input() -> void:
	#dir = Vector2.ZERO
	for i in inputs:
		if Input.is_action_pressed(i):
			if inputs[i].x != 0:
				var pressed_another = Input.is_action_pressed(get_key_by_value(inputs, -inputs[i]))
				if not pressed_another:
					change_directions[0] = true
				var check_prev_input = checked_inputs[0] and not pressed_another
				if (dir.x == -inputs[i].x and change_directions[0] and (not checked_inputs[0] or check_prev_input)) or dir.x == 0:
					dir.x = inputs[i].x
					checked_inputs[0] = true
					change_directions[0] = false
			elif inputs[i].y != 0:
				var pressed_another = Input.is_action_pressed(get_key_by_value(inputs, -inputs[i]))
				if not pressed_another:
					change_directions[1] = true
				var check_prev_input = checked_inputs[1] and not pressed_another
				if (dir.y == -inputs[i].y and change_directions[1] and (not checked_inputs[1] or check_prev_input)) or dir.y == 0:
					dir.y = inputs[i].y
					checked_inputs[1] = true
					change_directions[1] = false
			#dir += inputs[i]
		else:
			if inputs[i].x != 0 and inputs[i].x == dir.x:
				dir.x = 0
			elif inputs[i].y != 0 and inputs[i].y == dir.y:
				dir.y = 0
	checked_inputs = [false, false]
	#print(dir)


func get_key_by_value(dict: Dictionary, value) -> String:
	for i in dict:
		if dict[i] == value:
			return i
	return ""
#Test
