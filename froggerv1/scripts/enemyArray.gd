extends Node2D

onready var sprite = preload("res://scenes/enemy.tscn")

var units = Global.enemylvl

#just a simple for loop creating multiple instences of enemy
func _ready():
	print(Global.enemylvl)
	print(units)
	for i in range(units):
		var s = sprite.instance()
		add_child(s)
