extends Node

var current_game_state

enum GameState {
	MENU, #generate trail, deal 3 gear and park cards, gain canteen, shuffle all
	GAMESETUP, #get two year cards and pick one
	TUTORIAL, #setup weather tokens for season
	DAYONE
}

func _ready():
	change_state(GameState.GAMESETUP)
	
func change_state(new_state:GameState):
	current_game_state = new_state
	match new_state:
		GameState.MENU:
			pass
		GameState.GAMESETUP:
			ScaleManager.setup()
		GameState.TUTORIAL:
			pass
		GameState.DAYONE:
			pass
