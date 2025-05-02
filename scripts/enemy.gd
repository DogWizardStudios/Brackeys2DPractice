extends CharacterBody2D

@onready var player = %Player

@export var SPEED = 100


func _physics_process(delta):
	
	velocity = position.direction_to(player.position) * SPEED 
	
	move_and_slide()
