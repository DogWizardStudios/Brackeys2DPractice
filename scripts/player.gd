extends CharacterBody2D

var jump_count:int = 0
var max_jumps = 1

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@onready var jumps = $"../UI/Jumps"
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		jump_count += 1
		velocity.y = 0
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	#flip sprite to face direction moving
	if direction > 0:
		animated_sprite.flip_h = true
	elif direction < 0:
		animated_sprite.flip_h = false
	
	#play animation based on what player is doing
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("idle")
	
	#applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _process(delta):
	jumps.text = str(max_jumps - jump_count)
