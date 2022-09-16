extends Node2D

func _ready() -> void:
	$TitleThrust.play("exhaustmiddle")
	

func _process(delta: float) -> void:
	position.y -= 2
	if Input.is_action_just_pressed("ui_accept"):
#		$Global.dev_test_mode = false
		get_tree().change_scene("res://Scenes/World.tscn")
		
	if Input.is_action_just_pressed("ui_cancel"):
#		$Global.dev_test_mode = true
		get_tree().change_scene("res://Scenes/World.tscn")


func _on_Start_Button_pressed() -> void:
	$"/root/Global".test_mode = false
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_TestMode_Button_pressed() -> void:
	$"/root/Global".test_mode = true
	get_tree().change_scene("res://Scenes/World.tscn")
