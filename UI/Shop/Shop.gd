extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_purchase_pressed():
	if Game.GubBucks >= 100:
		Game.GubBucks -= 100
		Game.locust_owned = true
		Utils.save_game()
		print("Locust bought!")
		
		

