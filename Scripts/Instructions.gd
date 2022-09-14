extends Node2D

func _ready() -> void:
	if $"/root/Global".user_OS == "Windows" || $"/root/Global".user_OS == "OSX":
		$ColorRect/DesktopNotice.visible = true
	else:
		$ColorRect/MobileNotice.visible = true 

