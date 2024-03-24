extends Node

var quest_types = {
	0: "None",
	1: "Gather",
	2: "Build",
	3: "Upgrade",
	4: "LevelUp",
	5: "Defeat", 
	6: "Collect",
}
# The game is called Gub and is a collection and resource management game where you collect Gubs and use them to build and upgrade your base.
# Gubs are small insect creatures that can be found in the wild and can be used to gather resources, build structures and fight other Gubs and enemies.
# The game is set in a small forest area where you control your Gub empire and try to expand and grow your base and level up your Gubs.
# The game will have a main quest line and side quests that will help you progress and unlock new features and areas aswell as a leveling system for the base and each individual Gub.
# The game will also have a day and night cycle that will affect the Gubs and the resources available in the area.
# The player does not control and playable characters but rather manages a multitude of gubs and their resources and actions like in a city builder game.
# The quests are sorted into 4 categories: Main Quests, Side Quests, Collection Quests and Gub Quests.
# Main Quests are the main story line of the game and will unlock new features and areas.
# Side Quests are optional quests that will give you rewards and help you progress faster.
# Collection Quests are quests that require you to collect a certain amount of resources, items or gubs.
# Gub Quests are quests that require you to level up your gubs or achieve ceratin feats with them.

var Quests: Dictionary = {
	# MQ = Main Quest
	# SQ = Side Quest
	# CQ = Collection Quest
	# GQ = Gub quest
	"MQ001": {
		"Name": "A small adventure",
		"Type": quest_types[6],
		# Quests have a progress value that will be updated as the player progresses through the quest, this includes collecting items, leveling up gubs, building structures etc.
		# the criterias for the quest will be checked in the main game loop and the quest will be completed when the progress reaches the required value.
		# the description will be displayed in the quest log and will give the player a hint on what to do to progress the quest.
		"Progress": 0,
		"Target": 1,
		"Description": "Start your adventure by collecting your first Gub",
		"Reward": {
			"XP": 100,
			"Gold": 100,
		},
		"AvailableatLevel": 1,
	},
	"MQ002": {
		"Name": "A new home",
		"Type": quest_types[2],
		"Progress": 0,
		"Target": 1,
		"Description": "Build your first Gub house",
		"Reward": {
			"XP": 100,
			"Gold": 100,
		},
		"AvailableatLevel": 1,
	},
	"SQ001": {
		"Name": "A new friend",
		"Type": quest_types[6],
		"Progress": 0,
		"Target": 1,
		"Description": "Level up your first Gub",
		"Reward": {
			"XP": 100,
			"Gold": 100,
		},
		"AvailableatLevel": 1,
	},
}

var ActiveQuests: Dictionary = {}
var CompletedQuests: Array = []

func _ready():
	for q in Quests.keys():
		print(Quests[q]["Name"])

func addQuest(questId: String):
	if questId in Quests.keys():
		ActiveQuests[questId] = Quests[questId]

func advanceQuest(questId: String):
	if questId in ActiveQuests.keys():
		ActiveQuests[questId]["Progress"] += 1
	if ActiveQuests[questId]["Progress"] >= ActiveQuests[questId]["Target"]:
		completeQuest(questId)

func completeQuest(questId: String):
	if questId in ActiveQuests.keys():
		var completedQuest = ActiveQuests[questId]
		CompletedQuests.append(completedQuest)
		ActiveQuests.erase(questId)
		print("Quest completed: ", completedQuest["Name"])
