extends Node2D

var ISO_TILE_SIZE = [64, 32]
var TWH = ISO_TILE_SIZE[0] / 2   #TWH is Tile Width Half
var THH = ISO_TILE_SIZE[1] / 2   #THH is Tile Height Half

func FindTile() -> Array:     #finds tile in matrix     Actually, we can use tuples
	var mouse_pos = get_global_mouse_position()     #returns Vector2
	var matrix_tile = Vector2(0, 0)
	
	#matrix_tile.x += (mouse_pos.x / TWH + mouse_pos.y / THH) / 2
	#matrix_tile.y += matrix_tile.x - mouse_pos.x / TWH
	
	matrix_tile.x = (mouse_pos.x / TWH + mouse_pos.y / THH) / 2
	matrix_tile.y = (mouse_pos.y / THH - mouse_pos.x / TWH) / 2
	
	return matrix_tile

func _unhandled_input(event):   #It's here just for debugging. Remove when function isn't needed
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_SPACE:
			print(FindTile())
			print(get_global_mouse_position())
			print()
