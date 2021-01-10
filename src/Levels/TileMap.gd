extends TileMap



func _unhandled_input(event):   #It's here just for debugging. Remove when function isn't needed
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_SPACE:
			var mouse_pos = get_global_mouse_position()
			var tile_index = world_to_map(mouse_pos)
			print(tile_index)
			print(map_to_world(tile_index))
			print(get_global_mouse_position())
			print()

