extends Control

@onready var quest_panel: Node = $Panel
@onready var quests_container: Node = $Panel/TabContainer/Quests
var quest_panel_scene = preload("res://UI/Quests/QuestPanel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	populate_quest_log()
	

func populate_quest_log():
	for quest_id in QuestManager.Quests.keys():
		var quest_data = QuestManager.Quests[quest_id]
		var quest_entry = quest_panel_scene.instantiate()
		quest_entry.get_node("Name").text = quest_data["Name"]
		quest_entry.get_node("Description").text = quest_data["Description"]
		quests_container.add_child(quest_entry)

func _on_start_button_pressed(quest_id: String):
	print("clicked")
	QuestManager.addQuest(quest_id)
	print("Quest added: " + quest_id)
	print(QuestManager.ActiveQuests)

func _on_quest_button_pressed():
	if quest_panel.visible:
		quest_panel.hide()
	else:
		quest_panel.show()

func _unhandled_key_input(event):
	# if event.is_action_pressed("click"):
	quest_panel.hide()
