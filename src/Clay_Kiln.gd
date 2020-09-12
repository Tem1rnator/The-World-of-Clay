extends StaticBody2D



func _on_Area2D_body_entered(body: Node) -> void:
	print("hi")


func _on_Area2D_body_exited(body: Node) -> void:
	print("bye")
