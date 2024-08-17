extends Control

@export var left_text_box:RichTextLabel
@export var right_text_box:RichTextLabel
@export var left_button:Button
@export var right_button:Button
@export var page_turn_sound:AudioStreamPlayer2D

var current_left_page = 0

var page_data := [
	"Table of Contents:\n1. Parts of speech\n2. Dictionary",
	"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
	"minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
	"in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat",
	"non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	]
# Called when the node enters the scene tree for the first time.
func _ready():
	if page_data.size()%2:
		page_data.append("")
	if not current_left_page:
		left_button.visible = false
	left_text_box.text = page_data[0]
	right_text_box.text = page_data[1]

func _on_last_page_pressed():
	page_turn_sound.play()
	current_left_page -= 2
	left_text_box.text = page_data[current_left_page]
	right_text_box.text = page_data[current_left_page + 1]
	right_button.visible = true
	if not current_left_page:
		left_button.visible = false

func _on_next_page_pressed():
	page_turn_sound.play()
	current_left_page += 2
	left_text_box.text = page_data[current_left_page]
	right_text_box.text = page_data[current_left_page + 1]
	left_button.visible = true
	if current_left_page + 2 >= page_data.size():
		right_button.visible = false
