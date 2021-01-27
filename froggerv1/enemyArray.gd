extends Node2D

onready var sprite = preload("res://enemy.tscn")

#just a simple for loop creating multiple instences of enemy
func _ready():
	for i in range(6):
		var s = sprite.instance()
		add_child(s)
