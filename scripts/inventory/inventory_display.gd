extends GridContainer

var inventory = preload("res://assets/sprites/inventory/inventory.tres")

func _ready():
	inventory.item_changed.connect(_on_item_changed)
	update_inventory_display()

func update_inventory_display():
	for item_index in inventory.items.size():
		update_iventory_slot(item_index)
		
func update_iventory_slot(item_index):
	var inventory_slot_display = get_child(item_index)
	var item = inventory.items[item_index]
	inventory_slot_display.display_item(item)

func _on_item_changed(indexes):
	for item_index in indexes:
		update_iventory_slot(item_index)
