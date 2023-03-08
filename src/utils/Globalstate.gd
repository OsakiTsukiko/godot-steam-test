extends Node

# Steam Variables
var OWNED: bool = false
var ONLINE: bool = false
var STEAM_ID: int = 0
var STEAM_NAME: String = ""

# Lobby Variables
var DATA
var LOBBY_ID: int = 0
var LOBBY_MEMBERS: Array = []
var LOBBY_INVITE_ARG: bool = false

func _ready():
	var INIT := Steam.steamInit()
	if (INIT["status"] != 1):
		prints("Steam failed!", INIT["verbal"])
		get_tree().quit()
	
	ONLINE = Steam.loggedOn()
	STEAM_ID = Steam.getSteamID()
	STEAM_NAME = Steam.getPersonaName()
	OWNED = Steam.isSubscribed()
	
	if OWNED == false:
		print("User does not own this game!")
		get_tree().quit()
	
	prints(ONLINE, STEAM_ID, STEAM_NAME, OWNED)

func _process(delta):
	Steam.run_callbacks()
