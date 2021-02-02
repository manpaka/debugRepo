extends Node

var gameState : int = 1
var enemylvl : int
var enemyNumber : int

var loseState : bool = false
var winState : bool = false

var hello = "Hello Worlds"
var test = "THIS IS WORKING...?"
var bing = "boing"
var boing = "bing"

func _ready():
	pass

func _process(delta):
	gameStates()

func gameStates():
	if gameState == 1:
		enemylvl = 2
		enemyNumber = 4
		
	elif gameState == 2:
		enemylvl = 3
		enemyNumber = 4
		
	elif gameState == 3:
		enemylvl = 4
		enemyNumber = 5
		
	elif gameState == 4:
		enemylvl = 5
		enemyNumber = 5
		
	elif gameState == 5:
		enemylvl = 6
		enemyNumber = 6
