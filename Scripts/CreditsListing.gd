extends Node2D


func _physics_process(delta: float) -> void:
	if position.y > -990:
		position.y -= 0.5


func _on_PrivacyPolicy_pressed():
	pass # Replace with function body.
