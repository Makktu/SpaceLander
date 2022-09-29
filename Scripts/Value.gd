extends Label

export (Color,RGB) var text_color

func _ready() -> void:
	set_modulate(text_color)

func low_fuel():
	for n in 15:
		yield(get_tree().create_timer(0.2), "timeout")
		self.modulate = Color(1,0,0,1)
		yield(get_tree().create_timer(0.2), "timeout")
		self.modulate = Color(1,1,1,1)
#	self.modulate = Color(1,0,0,1)

func pickup_fuel():
	self.modulate = Color(1,1,1,1)
