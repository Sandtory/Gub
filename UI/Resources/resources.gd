extends CanvasLayer

@onready var gold_label = $GoldPanel/GoldLabel
@onready var dew_label = $DewPanel/DewLabel

func _process(delta):
	update_resource()
	
func update_resource():
	gold_label.text = str(Game.GubBucks)
	dew_label.text = str(Game.DewDrops)
	
