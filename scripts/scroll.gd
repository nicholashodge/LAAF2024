extends Node2D

@export var animator : AnimationPlayer
@export var text_box : RichTextLabel

var scroll_text = "3J"
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	text_box.text = scroll_text

func play_scroll_anim():
	animator.play("open_scroll")
	
