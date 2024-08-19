extends Node2D

@export var animator : AnimationPlayer
@export var button : Button
var char_sprites = [["res://assets/IMG_1498.PNG", "res://assets/IMG_1497.PNG"], ["res://assets/IMG_1496.PNG", "res://assets/IMG_1495.PNG"], ["res://assets/IMG_1494.PNG", "res://assets/IMG_1493.PNG"]]
# Called when the node enters the scene tree for the first time.
func _ready():
	character_enter(0)

func character_enter(character):
	print(str(character) + " has entered")
	animator.play("character_enter")

func _on_button_pressed():
	print("pressed")
	animator.play("scroll_trigger")

func _on_button_mouse_entered():
	pass
	#button.scale += Vector2(1.1, 1.1) effect here
