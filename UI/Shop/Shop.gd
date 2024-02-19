extends CanvasLayer

var locust_cost = 100
var select = 0
var currItem = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	switchCharacters(0)
	pass

func _on_purchase_button_pressed():
	var hasItem = false
	if Game.GubBucks >= Game.character_shop[currItem]["cost"]:
		for i in Game.inventory:
			if Game.inventory[i]["name"] == Game.character_shop[currItem]["name"]:
				Game.inventory[i]["count"] += 1
				hasItem = true
		if hasItem == false:
				var tempDic = Game.character_shop[currItem]
				tempDic["count"] = 1
				Game.inventory[Game.inventory.size()] = tempDic
		Game.GubBucks -= Game.character_shop[currItem]["cost"]
	else:
		print("Not enough GubBucks")
	print(Game.inventory)

	
	

func switchCharacters(select):
	for i in range(Game.character_shop.size()):
		if select == i:
			currItem = select
			print(Game.character_shop[currItem])
			get_node("Control/Character/Animation").play(Game.character_shop[currItem]["name"])
			get_node("Control/Name").text = Game.character_shop[currItem]["name"]
			get_node("Control/Description").text = Game.character_shop[currItem]["description"]
			get_node("Control/Cost").text = str(Game.character_shop[currItem]["cost"])+ "g"


func _on_next_pressed():
	switchCharacters(currItem+1)
		

func _on_prev_pressed():
	switchCharacters(currItem-1)
	
