extends Node2D

var rng = RandomNumberGenerator.new()

var speed = 256
var tileSize = 64

var lastPosition = Vector2()
var targetPosition = Vector2()
var moveDirection = Vector2()

func _ready():
	rng.randomize()
	
	position = position.snapped(Vector2(tileSize, tileSize))
	lastPosition = position
	position.x = (tileSize * rng.randi_range(0, 17))
	targetPosition = position

func _process(delta):
	#General Movement function
	movement(delta)
	#Teleports block back to the left side when it moves off screen
	flipFlop()

#modified version of player movements to just move the block right
func movement(delta):
	position.x += Global.enemylvl

#this function is what I'm having issues with. When the blocks move off screen the function activates but doesn't shut off when they are moved back to a lower value
func flipFlop():
	#detects when the block is off screen
	if position.x >= 1216:
		#moves block back to an off screen position
		position.x = (tileSize * rng.randi_range(0, 3) * -1)
		lastPosition = position
		targetPosition = position
