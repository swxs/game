extends CenterContainer

const INVENTORY = preload("res://assets/sprites/inventory/inventory.tres")

@onready var texture_rect = $TextureRect

func display_item(item):
	if item is Item:
		texture_rect.texture = item.texture
	else:
		texture_rect.texture = load("res://assets/sprites/inventory/EmptyInventorySlot.png")

func _get_drag_data(_position):
	var item_index = get_index()
	var item = INVENTORY.remove_item(item_index)
	if item is Item:
		var data = {}
		data.item = item
		data.item_index = item_index
		var drag_preview = TextureRect.new()
		drag_preview.texture = item.texture
		set_drag_preview(drag_preview)
		return data
	
func _can_drop_data(_position, data):
	return data is Dictionary and data.has("item")
	
func _drop_data(_position, data):
	var current_item_index = get_index()
	var current_item = INVENTORY.items[current_item_index]
	
	INVENTORY.swap_items(current_item_index, data.item_index)
	INVENTORY.set_item(current_item_index, data.item)
	
	
