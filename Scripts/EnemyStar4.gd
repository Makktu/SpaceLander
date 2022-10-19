extends Area2D

var init_direction_x = -0.25

var init_direction_y = 0.75

var max_x = 13258
var min_x = 12505

var max_y = 2708
var min_y = 479


func _ready() -> void:
	$AnimatedSprite.play("star")


func _on_EnemyStar_body_entered(body: Node) -> void:
	if body.name == "Player":
		if !$"/root/Global".test_mode:
			$"../Player".game_over()
		
func _physics_process(_delta: float) -> void:
	position.x += init_direction_x
	position.y += init_direction_y
	if position.x > max_x:
		init_direction_x = -1.5
	if position.x < min_x:
		init_direction_x = 1.5
	if position.y > max_y:
		init_direction_y = -0.75
	if position.y < min_y:
		init_direction_y = 0.75	


func _on_SoundProximity_body_entered(body: Node) -> void:
	if body.name == "Player":
		$AudioStreamPlayer2D.play()
		
