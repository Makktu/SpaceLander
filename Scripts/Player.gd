extends KinematicBody2D


onready var black_smoke = $BlackSmoke
onready var Collision_Sound = $AudioStreamPlayer2D
onready var fuel_alert_beep = get_node("%Alert")
onready var Swipe = $Camera2D/SwipeScreenButton
#onready var lander_wobble = $AnimationPlayer

var just_starting = true


# initialise swipe control variables
var swipe_up = false
var swipe_down = false
var swipe_left = false
var swipe_right = false

var swipe_down_released = false
var swipe_up_released = false
var swipe_left_released = false
var swipe_right_released = false
#####################################

var input_dir = 0
var y_input_dir = 0
#var SHIELDS = 100000
var FUEL = 3000
var FUEL_POD = 3000
var fuel_base_usage = 5
var fuel_alarm_threshold = FUEL / 10
var fuel_alert_played = false
#var PLAYER_SPEED = 200
var gameOver = false
var middleOn = false
var no_fuel = false
var speed = 0

#var jump_speed = -1800
var last_press = ""
var constant_press = 0
var constant_speed = 30



# THRUSTER VALUES:
var side_thrust = 10 # Sunday val: 10
var bottom_thrust = 20 # Sunday val: 20
var top_thrust = 10 # Sunday val: 10

# GLOBAL PHYSICS VALUES:
var acceleration = 2 # Sunday val: 5
var gravity = 0
var velocity = Vector2.ZERO
var friction = 0.0
var max_speed = 100

#var rng = RandomNumberGenerator.new()
#var button_released = false
#var lander_has_wobbled = false


#func lander_wobble():	
#	rng.randomize()
#	var random_wobbly = rng.randf_range(1, 10)
#	var random_degrees = rng.randf_range(0.1, 0.10)
#	for n in random_wobbly:
#		random_degrees = rng.randf_range(0.5, 4)
#		rotation_degrees += random_degrees
#		yield(get_tree().create_timer(0.1), "timeout")
#		rotation_degrees = 0
#		yield(get_tree().create_timer(0.1), "timeout")
#		rotation_degrees -= random_degrees
#		yield(get_tree().create_timer(0.1), "timeout")
#		rotation_degrees = 0
#		if button_released == true:
#			button_released = false
#			return
#
#	lander_has_wobbled = true



func game_over():
	gameOver = true
	$ThrustersOther.stop()
	$Thrusters.stop()
	$TopThrusters.stop()
	$TopThrusters.visible = false
	$LeftThrusters.stop()
	$LeftThrusters.visible = false
	$RightThrusters.stop()
	$RightThrusters.visible = false
	$AnimatedSprite.stop()
	$AnimatedSprite.visible = false
	
	if FUEL <= 0:
		# if reason for game over is fuel loss, permit drifting for short time...
		
		yield(get_tree().create_timer(0.5), "timeout")
		
	$Boom.play()
	$Kaboom.visible = true
	$Kaboom.play()
	$Sprite.visible = false
	$GUI/Fuel.text = "LANDER\nDESTROYED!"
	$GUI/Fuel/Value.text = ""
				

func _on_LaserBarrier_area_entered(area: Area2D) -> void:
	if !$"/root/Global".test_mode:
		game_over()


func _on_Boom_finished() -> void:
	get_tree().change_scene("res://Scenes/Game Over.tscn")


func update_GUI():
	FUEL += FUEL_POD
	$GUI/Fuel.adjust(FUEL)
	

func get_input():
	if gameOver:
		return

	input_dir = 0
	y_input_dir = 0
	
# UI LEFT
	if Input.is_action_pressed("ui_left") || swipe_right:
		if just_starting:
			just_starting = false
		input_dir += side_thrust
		if input_dir >= max_speed:
			input_dir = max_speed
		FUEL -= fuel_base_usage / 2
		$GUI/Fuel.adjust(FUEL)
		$RightThrusters.visible = true
		$RightThrusters.play()
		if !$ThrustersOther.playing:
			$ThrustersOther.play()

	if Input.is_action_just_released("ui_left") || swipe_right_released:
		swipe_right_released = false
		$ThrustersOther.stop()
		$RightThrusters.stop()
		$RightThrusters.visible = false
#############################

################## UI RIGHT #
	
	if Input.is_action_pressed("ui_right") || swipe_left:	
		if just_starting:
			just_starting = false	
		input_dir -= side_thrust
		FUEL -= fuel_base_usage / 2
		$GUI/Fuel.adjust(FUEL)	
		$LeftThrusters.visible = true
		$LeftThrusters.play()
		if !$ThrustersOther.playing:
			$ThrustersOther.play()

	if Input.is_action_just_released("ui_right") || swipe_left_released:
		swipe_left_released = false
		$ThrustersOther.stop()
		$LeftThrusters.stop()
		$LeftThrusters.visible = false
#############################
	
###################### UI DOWN #	
	
	if Input.is_action_pressed("ui_down") || swipe_up:
#		if not lander_has_wobbled:
#			lander_wobble()
#		rng.randomize()
#		var random_wobbly = rng.randf_range(1, 10000)
#		if random_wobbly > 7000:
#			lander_wobble.playback_speed = 5
#			lander_wobble.play("wobble")
#		$Camera2D.shake_camera()
		if just_starting:
			just_starting = false
		speed += constant_speed
		if speed > max_speed:
			speed = max_speed
		y_input_dir -= bottom_thrust
		$AnimatedSprite.visible = true
		FUEL -= fuel_base_usage
		$GUI/Fuel.adjust(FUEL)

		if !$Thrusters.playing:
			$Thrusters.volume_db = -15
			$Thrusters.play()
		if middleOn:
			$AnimatedSprite.play("exhaustmiddle")
		else:
			$AnimatedSprite.play("exhaustend", true)
			middleOn = true
			
	if Input.is_action_just_released("ui_down") || swipe_up_released:
#		lander_has_wobbled = false
#		button_released = true
#		$Camera2D.stop_shaking_camera()
		$AnimatedSprite.play("exhaustend")
		# turn OFF Thruster sound
		$Thrusters.playing = false
		middleOn = false
		swipe_up_released = false
		if !$AnimatedSprite.is_playing():
			$AnimatedSprite.visible = false
#########################################################			
			
######################### UI UP #########################
	if Input.is_action_pressed("ui_up") || swipe_down:
		if just_starting:
			just_starting = false
		speed += constant_speed
		y_input_dir += top_thrust
		FUEL -= fuel_base_usage / 2
		$GUI/Fuel.adjust(FUEL)
		$TopThrusters.visible = true
		$TopThrusters.play()
		if !$ThrustersOther.playing:
			$ThrustersOther.play()

	if Input.is_action_just_released("ui_up") || swipe_down_released:
		swipe_down_released = false
		$ThrustersOther.stop()
		$TopThrusters.stop()
		$TopThrusters.visible = false
#########################################################		

	if just_starting:
		velocity.y = move_toward(150, 0, friction)
		
	if input_dir != 0 || y_input_dir != 0:
		# accelerate when there's input
		if input_dir != 0:
			velocity.x = move_toward(velocity.x, input_dir * speed, acceleration)
		if y_input_dir != 0:
			velocity.y = move_toward(velocity.y, y_input_dir * speed, acceleration)			
	else:
		# slow down when there's no input (not applicable in zero-g)
		velocity.x = move_toward(velocity.x, 0, friction)
		velocity.y = move_toward(velocity.y, 0, friction)
		


func _physics_process(delta):
	if gameOver:
		return
		
	print(FUEL)
		
	if FUEL < 800:
		black_smoke.show()

		
	if FUEL <= fuel_alarm_threshold && !fuel_alert_played:
		fuel_alert_beep.play_alert()
		$GUI/Fuel/Value.low_fuel()		 
		fuel_alert_played = true

		
	if FUEL <= 0 && !$"/root/Global".test_mode:
		 game_over()
		
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	# my noob collision detection with surfaces	
#
	var input = Vector2()
	
#	yawDesired = yawInput * yawSpeed
#	yawFinal = yawFinal.move_towards(yawDesired, inertiaFactor)
#	rotate_y(yawFinal)

	input.x += float(Input.is_action_pressed('ui_left'))
	input.x -= float(Input.is_action_pressed('ui_right'))
	input.y += float(Input.is_action_pressed('ui_up'))
	input.y -= float(Input.is_action_pressed('ui_down'))	

	move_and_slide(input * speed * delta)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "TileMap" && !$"/root/Global".test_mode:
			Collision_Sound.play()
#			SHIELDS -= 1
#			print(SHIELDS)
#			if SHIELDS <= 0:
			game_over()
			

func _on_LaserBarrier_body_entered(body: Node) -> void:
	if !$"/root/Global".test_mode:
		game_over()


func _on_FuelPickup_body_entered(body: Node) -> void:
	FUEL += FUEL_POD
	$GUI/Fuel/Value.pickup_fuel()
	fuel_alert_played = false


func _input(event):
	if event is InputEventScreenDrag:
		if Swipe.get_swipe_direction(event.relative, 5) == Vector2.UP:
			swipe_down = true
		if Swipe.get_swipe_direction(event.relative, 5) == Vector2.DOWN:
			swipe_up = true
		if Swipe.get_swipe_direction(event.relative, 5) == Vector2.LEFT:
			swipe_right = true
		if Swipe.get_swipe_direction(event.relative, 5) == Vector2.RIGHT:
			swipe_left = true
			
	if Swipe.on_area == false && swipe_down == true:
		swipe_down_released = true
		swipe_down = false
	if Swipe.on_area == false && swipe_up == true:
		swipe_up_released = true
		swipe_up = false
	if Swipe.on_area == false && swipe_left == true:
		swipe_left_released = true
		swipe_left = false
	if Swipe.on_area == false && swipe_right == true:
		swipe_right_released = true
		swipe_right = false	
		
func _ready():
	$Camera2D.starting_camera_zoom()
	pass
