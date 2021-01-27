extends Node2D

var rng = RandomNumberGenerator.new()

var speed = 256
var tileSize = 64

var lastPosition = Vector2()
var targetPosition = Vector2()
var moveDirection = Vector2()

func _ready():
	position = position.snapped(Vector2(tileSize, tileSize))
	lastPosition = position
	
	rng.randomize()
	position.x = (tileSize * rng.randi_range(0, 17))
	
	targetPosition = position

func _process(delta):
	movement(delta)
	
	#teleports block back to the left side when it moves off screen
	flipFlop()


#modified version of player movements to just move the block right
func movement(delta):
	position += speed * moveDirection * delta
	if position.distance_to(lastPosition) >= tileSize - speed * delta:
		position = targetPosition
	if position == targetPosition:
		movementDirection()
		lastPosition = position
		targetPosition += moveDirection * tileSize
func movementDirection():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	moveDirection.x = + int(UP) + int(DOWN) + int(LEFT) + int(RIGHT)
	if moveDirection.x != 0 && moveDirection.y != 0:
		moveDirection = Vector2.ZERO


#this function is what I'm having issues with. When the blocks move off screen the function activates but doesn't shut off when they are moved back to a lower value
func flipFlop():
	#detects when the block is off screen
	if position.x >= 1216:
		#moves block back to an off screen position
		position.x = -64
		print("Flipped")
