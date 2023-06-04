class_name BT_Reload_Gun
extends BT_Node


signal character_reloaded

func tick(state : CharacterState) -> int:
	var equipment = state.character.inventory.current_mainhand_equipment as GunItem
	print(equipment)
	if equipment:
		print("Cultist reloading")
		equipment.reload()
		emit_signal("character_reloaded")
		return Status.SUCCESS
	print("Cultist didn't reload successfully?")
	return Status.FAILURE
