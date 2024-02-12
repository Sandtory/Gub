extends Node

#  when releasing use "users://savegame.bin"
const SAVE_PATH = "res://savegame.bin"

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"GubBucks": Game.GubBucks,
		"Gems": Game.Gems,
		"DewDrops": Game.DewDrops,
		"Locust": Game.locust_owned,
		"BuildingOne": Game.building1_owned
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
func load_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH):
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.GubBucks = current_line["GubBucks"]
				Game.Gems = current_line["Gems"]
				Game.DewDrops = current_line["DewDrops"]
				Game.locust_owned = current_line["Locust"]
				Game.building1_owned = current_line["BuildingOne"]
