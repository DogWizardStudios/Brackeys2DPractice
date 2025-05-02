extends CharacterBody2D

@onready var player = %Player
@onready var animated_sprite = $AnimatedSprite2D
@export var SPEED: float = 100.0
@onready var enemy_speed = $"../../UI/Enemy Speed"
@export var speed_growth = 4

func _process(delta):
	enemy_speed.text = str(SPEED).pad_decimals(2)

func _physics_process(delta):
	
	velocity = position.direction_to(player.position) * SPEED 
	if velocity.x > 0:
		animated_sprite.flip_h = true
	elif velocity.x < 0:
		animated_sprite.flip_h = false
	
	SPEED += (speed_growth * delta)
	move_and_slide()
