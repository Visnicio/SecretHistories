extends Resource
## This resource represents a stackable EquipementItem[br]
## To use it, just create a resource of type StackableResource, define the properties and attach on each scene/equipment you want to stack
class_name StackableResource

## A nickname for the stack, not used in code currently
@export var stack_name: String
## The max items this stack can hold
@export var max_stack: int
### This resource uses scenes to undertans what kind of scenes can go here
#@export var allowed_scenes: Array[PackedScene]
## Array of current stacked items
var items_stacked: Array[EquipmentItem]
#
#func check_if_item_is_allowed(item: EquipmentItem) -> bool:
	#for allowed_scene in allowed_scenes:
		#if item.is_class(allowed_scene.get_class()): 
			#return true
		#
	#return false

func add_item(item: EquipmentItem) -> void:
	items_stacked.append(item)
	#if item.item_size == GlobalConsts.ItemSize.SIZE_MEDIUM:
		#encumbrance += 1
	#if item.item_size == GlobalConsts.ItemSize.SIZE_BULKY:
		#encumbrance += 2

func _init() -> void:
	for i in items_stacked.size():
		items_stacked.remove_at(i)
