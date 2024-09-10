extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _ready() -> void:
	$AnimatedSprite2D.play("front_idel") # Ensure the correct animation name

func _physics_process(delta) :
	player_movement(delta)

func player_movement(delta):
	
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		velocity.y = 0
		velocity.x = 0
		play_anim(0)
	move_and_slide()

func play_anim(movement: int) -> void:
	var anim = $AnimatedSprite2D
	if current_dir == "right":
		anim.flip_h = false
		anim.play("side_walk" if movement == 1 else "side_idel")
	elif current_dir == "left":
		anim.flip_h = true
		anim.play("side_walk" if movement == 1 else "side_idel")
	elif current_dir == "down":
		anim.flip_h = false
		anim.play("front_walk" if movement == 1 else "front_idel")
	elif current_dir == "up":
		anim.flip_h = false
		anim.play("back_walk" if movement == 1 else "back_idel")
