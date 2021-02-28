extends Node2D

onready var line_l := $Left_line
onready var line_r := $Right_line
onready var clay_dough := $Clay_dough

var radius := 30
export var points_amount: int = 40
export var height: float = 100
export var width: float = 70
var c_line_x: float

#var r_points: Dictionary  #points in radius   #points and indexes if PoolVector2Array doesn't store indexes
#We don't need r_points

func _ready():
	clay_dough.rect_size.x = width
	c_line_x = clay_dough.rect_position.x + width/2
	line_r.position = Vector2.ZERO
	line_l.position = Vector2.ZERO
	
	
	lines_generation()
	
	#animations and clay, phase 1...
	
	#"animations":
	"""clay_dough.visible = false
	line_l.visible = true
	line_r.visible = true"""
	
	#line_r.get_points()
	#..
	
	#clay...
	
	#animations
	#saving


"""func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		var point = $TEST.points[0]
		$TEST.set_point_position(0, Vector2(point.x, point.y + 30))
		print("WEEEWE")"""

func _physics_process(delta):
	
	if Input.is_action_pressed("left_click"): #I'm not sure if it's a correct way of doing this
		
		#If statement Where is mouse

		#line_l.clear_points()
		for i in range(line_l.get_point_count()):
			var point = line_l.points[i]
			var mouse_pos = get_global_mouse_position()
			
			var delta_x = point.x - mouse_pos.x
			var delta_y = point.y - mouse_pos.y
			
			var distance = sqrt(pow(delta_x, 2) + pow(delta_y, 2))
			#r_points[str(i)] = distance    #Don't need this
			
			if distance <= radius:
				var new_delta_x = delta_x * radius / distance
				var new_delta_y = delta_y * radius / distance
				
				var new_pos = Vector2(mouse_pos.x + new_delta_x, mouse_pos.y + new_delta_y)
				line_l.set_point_position(i, new_pos)
				line_l.update()
				#print(line_l.points[i], new_pos)
		
		
		
		"""for i in range(38, line_l.points.size()):
			var point = line_l.points[i]
			#print(line_l.points[0])
			var mouse_pos = get_global_mouse_position()
			var distance = sqrt(pow((point.x - mouse_pos.x), 2) + pow((point.y - mouse_pos.y), 2))
			print(distance)
		print()"""


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
		#print(c_line_x - width/2)
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
