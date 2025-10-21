extends CharacterBody2D

# handles all player input
#can add new player inputs here 
#and animations

# Movement speed
var speed_factor = 100  # Set to 100

# Reference to the highlight ColorRects
@onready var r_highlight = $R_highlight
@onready var l_highlight = $L_highlight
@onready var u_highlight = $U_highlight
@onready var d_highlight = $D_highlight
@onready var player_sprite = $AnimatedSprite2D

func _ready():
	# Hide all highlights initially
	update_highlight_visibility(Vector2.ZERO)

func _physics_process(_delta):
	var input_direction = Vector2.ZERO

	# Check for input and set the input direction
	if Input.is_action_pressed("ui_up"):
		input_direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_direction.y += 1
	if Input.is_action_pressed("ui_left"):
		input_direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_direction.x += 1
	
	#Flip Sprite
	if input_direction.x > 0:
		player_sprite.flip_h = false
	elif input_direction.x < 0:
		player_sprite.flip_h = true
	
	#Play anime
	if input_direction == Vector2.ZERO:
		player_sprite.play("idle")
	else:
		player_sprite.play("run")

	# Normalize the input direction to avoid faster diagonal movement
	if input_direction != Vector2.ZERO:
		input_direction = input_direction.normalized()
	
	# Set the velocity based on input direction
	velocity = input_direction * speed_factor

	# Move the character using move_and_slide
	move_and_slide()

	# Update highlight visibility based on input direction
	update_highlight_visibility(input_direction)

# Function to update the visibility of the highlight ColorRects
func update_highlight_visibility(direction: Vector2):
	r_highlight.visible = false
	l_highlight.visible = false
	u_highlight.visible = false
	d_highlight.visible = false

	if direction.x > 0:
		r_highlight.visible = true  # Right
	elif direction.x < 0:
		l_highlight.visible = true  # Left
	elif direction.y > 0:
		d_highlight.visible = true  # Down
	elif direction.y < 0:
		u_highlight.visible = true  # Up
