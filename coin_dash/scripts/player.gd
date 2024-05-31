extends Area2D

signal pickup
signal hurt

@export var speedvar: int 
var velocity = Vector2()
var screensize = Vector2(480, 720)

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready(): 
	# Called every time the node is added to the scene. 
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speedvar
	
	if velocity.length() > 0:
		animated_sprite_2d.animation = "run"        
		animated_sprite_2d.flip_h = velocity.x < 0
	else:
		animated_sprite_2d.animation = "idle"
		
	position += velocity * delta   
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

func die():
	animated_sprite_2d.animation = "hurt"
	set_process(false)
	
func _on_area_entered(area):
	if area.is_in_group("coins"):
		area.pickup()
		emit_signal("pickup")
	if area.is_in_group("obstacles"):
		emit_signal("hurt")
		die()
