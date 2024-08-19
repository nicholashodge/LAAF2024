extends Node

var current_game_state

enum GameState {
	GAMESETUP, #generate trail, deal 3 gear and park cards, gain canteen, shuffle all
	PICKYEAR, #get two year cards and pick one
	SEASONSETUP, #setup weather tokens for season
	PLAYERMOVE,
	RANGERMOVE,
	ENDOFSEASON, #photo, empty canteens, shuffle new longer trail, new season, return hikers
	ENDOFGAME #add points
}

func _ready():
	#trail_manager = get_tree().get_first_node_in_group("trail_manager")
	change_state(GameState.GAMESETUP)
	
func change_state(new_state:GameState):
	current_game_state = new_state
	match new_state:
		GameState.GAMESETUP:
			ScaleManager.setup()
		GameState.PICKYEAR:
			pass
		GameState.SEASONSETUP:
			pass
		GameState.PLAYERMOVE:
			pass
		GameState.RANGERMOVE:
			pass
		GameState.ENDOFSEASON:
			pass
		GameState.ENDOFGAME:
			pass
