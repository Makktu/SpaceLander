extends Area2D

var init_direction_x = 1

var init_direction_y = 3

var max_x = 6629
var min_x = 6386

var max_y = 1264
var min_y = -636


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
		init_direction_x = -1
	if position.x < min_x:
		init_direction_x = 1
	if position.y > max_y:
		init_direction_y = -3
	if position.y < min_y:
		init_direction_y = 3
		
	
