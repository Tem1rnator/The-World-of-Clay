extends Position2D

onready var Player = $".."
onready var Camera_Offset = $"CameraOffset"
var pivot_offset = 154   #We can make it Vector2

func _ready():
	update_pivot_angle()

func _physics_process(delta):
	if Player.dir == Vector2.ZERO:
		Camera_Offset.position = Vector2.ZERO
	else:
		update_pivot_angle()

func update_pivot_angle():
	Camera_Offset.position = Vector2(pivot_offset, 0)
	rotation = Player.dir.angle()
