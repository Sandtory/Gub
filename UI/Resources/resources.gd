extends CanvasLayer

@onready var gold_label = $GoldPanel/GoldLabel
@onready var dew_label = $DewPanel/DewLabel

func _process(delta):
	update_resource()
	
func update_resource():
	var gubbucks_resource = load("res://Resources/baseitem_stack.tres")
	gold_label.text = "Gub Bucks: " + str(gubbucks_resource.count)
	dew_label.text = str(Game.DewDrops)
	


func _on_gold_button_pressed():
	var gubbucks_resource = load("res://Resources/baseitem_stack.tres")
	gubbucks_resource.count += 50
	print("Button pressed")
