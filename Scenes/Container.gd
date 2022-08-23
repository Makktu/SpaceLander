extends Node2D

#var rng = RandomNumberGenerator.new()
#var random_x = 0
#var random_y = 2

func _ready() -> void:
	$TitleThrust.play("exhaustmiddle")
#	rng.randomize()
#	random_x = rng.randf_range(-4, 4)
#	random_y = rng.randf_range(-4, 4)


func _process(delta: float) -> void:
#	position.x += random_x
	position.y -= 5


func _on_Start_Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/World.tscn")
