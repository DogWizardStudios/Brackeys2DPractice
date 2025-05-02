extends CharacterBody2D

@onready var player = %Player
@onready var animated_sprite = $AnimatedSprite2D
@export var SPEED = 100


func _physics_process(delta):
	
	velocity = position.direction_to(player.position) * SPEED 
	if velocity.x > 0:
		animated_sprite.flip_h = true
	elif velocity.x < 0:
		animated_sprite.flip_h = false
	
	
	move_and_slide()
