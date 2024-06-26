extends GridContainer

var inventory = preload("res://assets/sprites/inventory/inventory.tres")

func _ready():
	inventory.item_changed.connect(_on_item_changed)
	update_inventory_display()

func update_iventory_slot(item_index):
	var inventory_slot_display = get_child(item_index)
	var item = inventory.items[item_index]
	inventory_slot_display.display_item(item)

func update_inventory_display():
	for item_index in inventory.items.size():
		update_iventory_slot(item_index)

func _on_item_changed(indexes):
	for item_index in indexes:
		update_iventory_slot(item_index)

func _unhandled_input(event):
	print(event.as_text())
	if event.is_action_released("ui_left_mouse"):
		print(inventory.drag_item)
		if inventory.drag_item is Dictionary:
			inventory.set_item(inventory.drag_item.item_index, inventory.drag_item.item)
