extends Node2D

var move_lightning = 1

func _physics_process(delta: float) -> void:
	position.x += move_lightning
	yield(get_tree().create_timer(0.25), "timeout")
	if position.x > 700:
		move_lightning = -1
		$AnimatedSprite.speed_scale = 1
	if position.x < 0:
		move_lightning = 1
		$AnimatedSprite.speed_scale = 0.6

func _ready() -> void:
	$AnimatedSprite.speed_scale = 0.6
	$AnimatedSprite.play("lightning")
