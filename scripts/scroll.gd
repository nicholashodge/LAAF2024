extends Node2D

@export var animator : AnimationPlayer
@export var text_box : RichTextLabel

var scroll_text = "Hello world\nwoot woot\nthis is a test to see if wrapping works"
# Called when the node enters the scene tree for the first time.
func _ready():
	text_box.text = scroll_text
	animator.play("open_scroll")
