extends Control


func _ready():
# TODO: choose which of three random Help screens
#	randi() % 3
#	$CenterContainer/Help.texture_normal = help_screen
	
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _input(event):
	if event.is_action_pressed("fullscreen"):
		VideoSettings.set_fullscreen_enabled(!VideoSettings.is_fullscreen_enabled())
		# Size the center container to screen size
	elif event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_cancel"):
		$Timer.start()
		_on_Timer_timeout()


func _on_PreMusicTimer_timeout():
	BackgroundMusic.play()
	$Timer.start()


func _on_MadeWithGodot_pressed():
	$CenterContainer/MadeWithGodot.visible = false


func _on_GPL_pressed():
	$CenterContainer/GPL.visible = false


func _on_Winners_pressed():
	$CenterContainer/Winners.visible = false


func _on_Help_pressed():
	var _error = get_tree().change_scene("res://scenes/UI/title_menu.tscn")


func _on_Timer_timeout():
	if $CenterContainer/MadeWithGodot.visible == true:
		$CenterContainer/MadeWithGodot.visible = false
	elif $CenterContainer/GPL.visible == true:
		$CenterContainer/GPL.visible = false
	elif $CenterContainer/Winners.visible == true:
		$CenterContainer/Winners.visible = false
	elif $CenterContainer/Help.visible == true:
		var _error = get_tree().change_scene("res://scenes/UI/title_menu.tscn")
