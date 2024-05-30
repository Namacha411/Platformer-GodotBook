extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
enum State {STAND, FALL, LAND}

@onready var sprite = $Sprite
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_move: bool = true
var state = State.STAND

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		state = State.FALL
		velocity.y += gravity * delta
		if 0.0 < velocity.y:
			sprite.play("fall")
		else:
			sprite.play("jump")
	else:
		if state == State.FALL:
			state = State.LAND
			sprite.play("land", 4.0)
			await sprite.animation_looped
			state = State.STAND

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		Audio.get_node("Jump").play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if !can_move:
		pass
	elif direction:
		if direction == -1:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		if state == State.STAND:
			sprite.play("walk")
		velocity.x = direction * SPEED
	else:
		if state == State.STAND:
			sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func knockback():
	can_move = false
	if sprite.flip_h:
		velocity = Vector2(100, -300)
	else:
		velocity = Vector2(-100, -300)
	await get_tree().create_timer(0.5).timeout
	can_move = true
