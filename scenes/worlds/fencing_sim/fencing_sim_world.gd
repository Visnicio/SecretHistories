extends GameWorld

@export var enemy_spawner: FencingSimEnemySpawner

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_switch_mouse_capture"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
	
	ImGui.Begin("Debug Panel")
	ImGui.Text("Settings: enemies_with_darkvision = " + str(Settings.get_setting("enemies_with_darkvision")))
	if ImGui.Button("Spawn Test Enemy"):
		enemy_spawner.spawn_enemy_on_random_candle()
		pass
	ImGui.End()
