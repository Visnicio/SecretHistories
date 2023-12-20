class_name BTFreeInterest extends BTAction


func tick(state: CharacterState) -> int:
	if !is_instance_valid(state.target):
		return FAILED
	
	if !(state.target.object is Player):
		state.interest_machine.remove_event(state.target)
	
	return OK