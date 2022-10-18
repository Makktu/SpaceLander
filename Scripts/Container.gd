extends Node2D

var move_lightning = 2



func _physics_process(_delta: float) -> void:
	$AnimationAll.position.x += move_lightning
	if $AnimationAll.position.x > 700:
		move_lightning = -move_lightning
#		$AnimationAll/AnimatedSprite.speed_scale = 0.7
	if $AnimationAll.position.x < 0:
		move_lightning = -move_lightning
#		$AnimationAll/AnimatedSprite.speed_scale = 0.8

func _ready() -> void:
	$TitleThrust.play("exhaustmiddle")
	$AnimationAll/AnimatedSprite.speed_scale = 0.8
	$AnimationAll/AnimatedSprite.play("lightning")
	

func _process(_delta: float) -> void:
	position.y -= 2
	if Input.is_action_just_pressed("ui_accept"):
#		$Global.dev_test_mode = false
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/World.tscn")


func _on_Start_Button_pressed() -> void:
	$"/root/Global".test_mode = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/World.tscn")
	
func _on_TestMode_Button_pressed() -> void:
	$"/root/Global".test_mode = true
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_Credits_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Credits.tscn")
