extends Node2D

func _ready() -> void:
	$TitleThrust.play("exhaustmiddle")
	

func _process(delta: float) -> void:
#	position.x += random_x
	position.y -= 5
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/World.tscn")


func _on_Start_Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/World.tscn")
