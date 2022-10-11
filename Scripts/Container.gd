extends Node2D

var move_lightning = 5

func _physics_process(delta: float) -> void:
	position.x += move_lightning
#	yield(get_tree().create_timer(0.25), "timeout")
	if position.x > 700:
		move_lightning = -5
		$AnimationAll/AnimatedSprite.speed_scale = 1
	if position.x < 0:
		move_lightning = 5
		$AnimationAll/AnimatedSprite.speed_scale = 1.2

func _ready() -> void:
	$TitleThrust.play("exhaustmiddle")
	$AnimationAll/AnimatedSprite.speed_scale = 1
	$AnimationAll/AnimatedSprite.play("lightning")
	

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


func _on_Credits_pressed() -> void:
	get_tree().change_scene("res://Scenes/Credits.tscn")
