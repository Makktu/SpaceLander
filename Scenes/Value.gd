extends Label

export (Color,RGB) var text_color

func _ready() -> void:
	set_modulate(text_color)

func low_fuel():
	self.modulate = Color(1,0,0,1)

func pickup_fuel():
	self.modulate = Color(1,1,1,1)
