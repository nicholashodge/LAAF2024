extends Node2D

var left_scale
var right_scale
#var scale_prefab = preload("res://scenes/scale.tscn")
var weight_prefab = preload("res://scenes/weight.tscn")

var active_weight:WeightObject

var number_of_weights := 3 #can change for different levels (maybe 1-2 for first level)

func _ready():
	setup()

func setup():
	#left_scale = %LeftSide
	#right_scale = %RightSide
	generate_weights(3)

func generate_weights(length:int):
	#instantiate sites and add to instances deck
	for i in length:
		var new_weight = weight_prefab.instantiate()
		new_weight.position = Vector2(100*i + 200, 0)
		new_weight.selected.connect(_on_weight_selected)
		new_weight.released.connect(_on_weight_released)
		#new_weight.cancelled.connect(_on_weight_cancelled)
		#instanced_weight_deck.append(new_weight)
		add_child(new_weight)

func _on_weight_selected(moving_weight:WeightObject):
	active_weight = moving_weight

#func _on_scale_selected(selected_scale:Scale):
		#active_weight.display_highlight(false)
	#var tween = get_tree().create_tween()
	#tween.tween_property(active_weight, "position", selected_site.global_position, 0.5).set_ease(Tween.EASE_OUT)

	#DragManager.is_weight_selected = false
	#active_weight.is_selected = false
	
func _on_weight_released():
	#get closest scale side
	if active_weight:
		var overlapping_areas = active_weight.get_overlapping_areas()
		if overlapping_areas.size() > 0:
			print("released on " + str(overlapping_areas.size()))
			var closest_area = overlapping_areas[0]
			var closest_dist = overlapping_areas[0].global_position.distance_to(active_weight.global_position)
			for close_area in overlapping_areas:
				var dist = close_area.global_position.distance_to(active_weight.global_position)
				if dist < closest_dist:
					closest_dist = dist
					closest_area = close_area
			#snap to closest
			print("snapping to " + str(closest_area))
			active_weight.snap_to_site(closest_area)
		else:
			cancel_move()

func _on_hiker_cancelled():
	cancel_move()
	
func cancel_move():
	active_weight.return_to_prev()
	#highlight_available(false)
	active_weight = null
