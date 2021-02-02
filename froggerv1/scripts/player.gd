extends KinematicBody2D

var speed = 256
var tileSize = 64 

var lastPosition = Vector2()
var targetPosition = Vector2()
var moveDirection = Vector2()

#loading raycast and sprite
onready var ray = $RayCast2D
onready var sprite : AnimatedSprite = get_node("AnimatedSprite")

func _ready():
	position = position.snapped(Vector2(tileSize, tileSize))
	lastPosition = position
	targetPosition = position
	
func _process(delta):
	movement(delta)

#this controls the movement and the distance moved
func movement(delta):
	if ray.is_colliding():
		position = lastPosition
		targetPosition = lastPosition
	else:
		position += speed * moveDirection * delta
		if position.distance_to(lastPosition) >= tileSize - speed * delta:
			position = targetPosition
	if position == targetPosition:
		if Global.loseState == false:
			movementDirection()
			lastPosition = position
			targetPosition += moveDirection * tileSize

#this is watching for the movement direction/keys
func movementDirection():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	moveDirection.x = -int(LEFT) + int(RIGHT)
	moveDirection.y = -int(UP) + int(DOWN)
	
	if moveDirection.x != 0 && moveDirection.y != 0:
		moveDirection = Vector2.ZERO
	if moveDirection != Vector2.ZERO:
		ray.cast_to = moveDirection * tileSize / 2
	
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite.set_flip_v(false)
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.set_flip_v(true)

func die():
	Global.loseState = true
	print(Global.loseState)

func win():
	Global.winState = true
	print(Global.winState)

func gameOverState():
	pass

func _on_Area2D_area_entered(area):
	if "death" in area.get_name():
		die()
	if "win" in area.get_name():
		win()
