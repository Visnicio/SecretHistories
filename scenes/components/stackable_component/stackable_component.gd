extends Node3D
class_name StackableComponent
## This Components can be attached to any InventoryItem to implement a stacking behavior on top of the item[br]
## The class uses a resource since its stored on disk by default

## The reference for the stack
@export var stackable_resource: StackableResource

## Just a holder for the object parent
var parent: Node3D

func _ready() -> void:
	parent = get_parent()


## Checks if its possible to add a item to the stack
func stack_available() -> bool:
	var desired_stack = stackable_resource.items_stacked.size() + 1
	if desired_stack >= stackable_resource.max_stack: return false
	return true

func add_item(new_item: PickableItem) -> bool:
	var item_added = false
	if stack_available():
		# TODO - check if the item added is of the same stack
		stackable_resource.items_stacked.append(new_item)
		item_added = true
		
	return item_added
