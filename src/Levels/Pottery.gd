extends Node2D

onready var line_l := $Left_line
onready var line_r := $Right_line
onready var clay_dough := $Clay_dough

var radius := 5
export var points_amount: int = 40
export var height: float = 100
export var width: float = 70
var c_line_x: float
#we can add more variables

func _ready():
	clay_dough.rect_size.x = width
	c_line_x = clay_dough.rect_position.x + width/2
	line_l.position = Vector2.ZERO
	line_r.position = Vector2.ZERO
	
	
	lines_generation()
	
	#animations and clay, phase 1...
	
	#"animations":
	"""clay_dough.visible = false
	line_l.visible = true
	line_r.visible = true"""
	
	#line_r.get_points()
	#..
	var r_points: Dictionary  #points in radius   #points and indexes if PoolVector2Array doesn't store indexes
	#clay...
	
	#animations
	#saving

"""func _unhandled_input(event):
	if Input.is_mouse_button_pressed():
		#...
		pass"""

#func push_points(Vector2) -> void:
	#math
	
	#return Vector2

func lines_generation():
	var points_l: PoolVector2Array
	var points_r: PoolVector2Array
	var points_y: float = clay_dough.rect_position.y
	var add_points_y: float = height/points_amount
	
	for i in range(points_amount):
		points_l.append(Vector2(c_line_x - width/2, points_y))
		print(c_line_x - width/2)
		points_y -= add_points_y
	
	points_y = clay_dough.rect_position.y
	for i in range(points_amount):
		points_r.append(Vector2(c_line_x + width/2, points_y))
		points_y -= add_points_y
	
	#print(points_l)
	#print()
	#print(points_r)
	line_l.points = points_l
	line_r.points = points_r
