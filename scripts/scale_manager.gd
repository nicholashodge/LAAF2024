extends Node2D

#var scale_prefab = preload("res://scenes/scale.tscn")
var weight_prefab = preload("res://scenes/weight.tscn")

var active_weight:WeightObject

var number_of_weights := 3 #can change for different levels (maybe 1-2 for first level)
signal scales_changed

func setup():
	generate_weights(3)

func generate_weights(length:int):
	#instantiate sites and add to instances deck
	for i in length:
		var new_weight = weight_prefab.instantiate()
		new_weight.position = Vector2(100*i + 400, 0)
		new_weight.selected.connect(_on_weight_selected)
		new_weight.released.connect(_on_weight_released)
		new_weight.cancelled.connect(_on_weight_cancelled)
		#instanced_weight_deck.append(new_weight)
		get_tree().get_root().get_node("Game").add_child.call_deferred(new_weight)

func _on_weight_selected(moving_weight:WeightObject):
	active_weight = moving_weight
	
func _on_weight_released():
	#get closest scale side
	if active_weight:
		var overlapping_areas = active_weight.get_overlapping_areas()
		if overlapping_areas.size() > 0:
			var closest_area = overlapping_areas[0]
			var closest_dist = overlapping_areas[0].global_position.distance_to(active_weight.global_position)
			for close_area in overlapping_areas:
				var dist = close_area.global_position.distance_to(active_weight.global_position)
				if dist < closest_dist:
					closest_dist = dist
					closest_area = close_area
			#snap to closest
			active_weight.snap_to_site(closest_area)
			make_weight_child_of_scale(active_weight, closest_area)
			
			scales_changed.emit(active_weight, closest_area.is_in_group("left"))
			active_weight = null
		else:
			cancel_move()

func _on_weight_cancelled():
	cancel_move()
	
func cancel_move():
	active_weight.return_to_prev()
	active_weight = null

func make_weight_child_of_scale(node, new_parent):
	var old_parent = get_tree().get_root().get_node("Game")
	old_parent.remove_child(node)
	new_parent.add_child(node)
	node.set_owner(new_parent)
