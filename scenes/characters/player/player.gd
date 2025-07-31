#extended only for class_name reasons
extends HumanoidCharacter
class_name Player


func _ready() -> void:
	GameManager.player = self
	inventory = $Inventory
	
