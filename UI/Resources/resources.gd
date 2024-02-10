extends CanvasLayer

@onready var gold_label = $PanelContainer/MarginContainer/GridContainer/GoldLabel
@onready var gem_label = $PanelContainer/MarginContainer/GridContainer/GemLabel
@onready var dew_label = $PanelContainer/MarginContainer/GridContainer/DewLabel

func _process(delta):
	update_resource()
	
func update_resource():
	gold_label.text = str(Game.GubBucks)
	gem_label.text = str(Game.Gems)
	dew_label.text = str(Game.DewDrops)
	
