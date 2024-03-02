extends Node

var instance = null

# Singleton instance setup
func _ready():
	instance = self

# Signal for item purchase
signal item_purchased(item_type)

# Function to handle item purchase
func purchase_item(item_type):
	emit_signal("item_purchased", item_type)
