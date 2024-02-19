extends CanvasLayer

@onready var gold_label = $Panel/GoldLabel
@onready var gem_label = $Panel/GemLabel
@onready var dew_label = $Panel/DewLabel

func _process(delta):
	update_resource()
	
func update_resource():
	gold_label.text = str(Game.GubBucks)
	gem_label.text = str(Game.Gems)
	dew_label.text = str(Game.DewDrops)
	
