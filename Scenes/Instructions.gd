extends Node2D

func _ready() -> void:
	if $"/root/Global".user_OS == "Android" or $"/root/Global".user_OS == "iOS":
		$ColorRect/MobileNotice.visible = true
	else:
		$ColorRect/DesktopNotice.visible = true 

