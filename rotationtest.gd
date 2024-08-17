extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation", -0.5, 0.7).set_ease(Tween.EASE_IN_OUT)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
