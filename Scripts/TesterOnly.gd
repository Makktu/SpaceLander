extends Node2D

onready var the_player = load("res://Scenes/WorldPlayer.tscn").instance()

# var enemy = load(enemy_path).instance()
# add_child(enemy)
#
func _ready() -> void:
	add_child(the_player)

	the_player.position.x = 340
	the_player.position.y = 620
	the_player.velocity.y = 30
#	the_player."Fa".play("fadeout")
#	$"../Player/FadeOut".play("fadeout", true)

func _physics_process(delta: float) -> void:
	if the_player.FUEL < 2000:
		print("WORKING")
