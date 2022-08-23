extends KinematicBody2D

export var FUEL = 50000

var leftToggle = false
var rightToggle = false
var upToggle = false
var downToggle = false

var PLAYER_SPEED = 400
var gameOver = false
var GAME_OVER = 580 # position on the y-axis where the player 'touches ground'
var FALLING_FASTER = GAME_OVER - 200


var middleOn = false
var no_fuel = false
var length_pressed = 0



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
	$Boom.play()
	

func _physics_process(delta: float) -> void:
	
#	if leftToggle:
#		position.x += 2
		
#	if upToggle:
#		position.y -= 3
	
	if gameOver:
		return
		
	position.y += 1
#	position.x += 4

	if position.y > GAME_OVER:
		game_over()
	
	if no_fuel:
		position.y += 2		
		return
	
	if FUEL <= 0:
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
		no_fuel = true
		return
	
	
	if FUEL > 0:	
		
		var input = Vector2()
		
		input.x += float(Input.is_action_pressed('ui_left'))
		input.x -= float(Input.is_action_pressed('ui_right'))
		input.y += float(Input.is_action_pressed('ui_up'))
		input.y -= float(Input.is_action_pressed('ui_down'))
		
		if Input.is_action_pressed("ui_down"):
			upToggle = true
#			length_pressed += 1
			$AnimatedSprite.visible = true
			FUEL -= 100
			$GUI/Fuel.adjust(FUEL)

#			position.y -= PLAYER_SPEED / 5
#			if length_pressed > 100:
#				position.y -= PLAYER_SPEED / 5
			if !$Thrusters.playing:
				$Thrusters.volume_db = -15
				$Thrusters.play()
			if middleOn:
				$AnimatedSprite.play("exhaustmiddle")
			else:
				$AnimatedSprite.play("exhaustend", true)
				middleOn = true
				
		if Input.is_action_just_released("ui_down"):
			length_pressed = 0
			$AnimatedSprite.play("exhaustend")
			# always turn OFF Thruster sound
			$Thrusters.playing = false
			middleOn = false
			if !$AnimatedSprite.is_playing():
				$AnimatedSprite.visible = false
				
		if Input.is_action_pressed("ui_up"):
			position.y += 1
			FUEL -= 50
			$GUI/Fuel.adjust(FUEL)
			$TopThrusters.visible = true
			$TopThrusters.play()
			if !$ThrustersOther.playing:
				$ThrustersOther.play()
				
		if Input.is_action_just_released("ui_up"):
			$ThrustersOther.stop()
			$TopThrusters.stop()
			$TopThrusters.visible = false
			
		if Input.is_action_pressed("ui_left"):
			leftToggle = true
			position.x += 2
			FUEL -= 50
			$GUI/Fuel.adjust(FUEL)
			$RightThrusters.visible = true
			$RightThrusters.play()
			if !$ThrustersOther.playing:
				$ThrustersOther.play()
			
		if Input.is_action_just_released("ui_left"):
			$ThrustersOther.stop()
			$RightThrusters.stop()
			$RightThrusters.visible = false
			
		if Input.is_action_pressed("ui_right"):
			leftToggle = false
			position.x -= 2
			FUEL -= 50
			$GUI/Fuel.adjust(FUEL)	
			$LeftThrusters.visible = true
			$LeftThrusters.play()
			if !$ThrustersOther.playing:
				$ThrustersOther.play()
				
		if Input.is_action_just_released("ui_right"):
			$ThrustersOther.stop()
			$LeftThrusters.stop()
			$LeftThrusters.visible = false
#		else:
#			$Thrusters.playing = false		
	# check for GAME OVER condition
		
		

		if input.length() != 0:
			input = input.normalized()

		move_and_collide(input * PLAYER_SPEED * delta)
		
		if !input:
			move_and_collide(input * PLAYER_SPEED * delta)
			
	


func _on_Boom_finished() -> void:
	get_tree().change_scene("res://Scenes/Game Over.tscn")


func _on_TheGround_body_entered(body: Node) -> void:
	print("THAT'S IT !")
	game_over()


func _on_Pickup_body_entered(body):
	FUEL += 10000
	$GUI/Fuel.adjust(FUEL)
	
func cancel_drift():
	leftToggle = false
	rightToggle = false
	upToggle = false
	downToggle = false	
