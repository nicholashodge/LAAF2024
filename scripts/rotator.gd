extends StaticBody2D

func rotate_scale(destination: float):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation", destination, 0.5).set_ease(Tween.EASE_IN_OUT)
