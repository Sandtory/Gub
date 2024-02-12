extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_purchase_locust_button_pressed():
	if Game.GubBucks >= 100 and Game.locust_owned == false:
		Game.GubBucks -= 100
		Game.locust_owned = true
		Utils.save_game()
		print("Locust bought!")
	else:
		print("Locust already owned!")


func _on_purchase_building_button_pressed():
	if Game.GubBucks >= 200 and Game.building1_owned == false:
		Game.GubBucks -= 200
		Game.building1_owned = true
		Utils.save_game()
		print("Building One Bought")
	else:
		print("Building one already owned!")
