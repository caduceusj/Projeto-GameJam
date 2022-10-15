extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet = preload("res://Cenas/Bullet.tscn") 
export var bullet_speed = 1000
export var fire_rate = 0.2
var movespeed = 500
var can_fire = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body


func _physics_process(delta):
	move()
	
	if Input.is_action_just_pressed("LMB") and can_fire:
		fire()

func move():
	var motion = Vector2()

	if Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
		motion.y -= 1
	elif Input.is_action_pressed("ui_down") and !Input.is_action_pressed("ui_up"):
		motion.y += 1
	if Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
		motion.x -= 1
	elif Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
		motion.x += 1
		
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = position
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().add_child(bullet_instance)
	can_fire = false
	yield(get_tree().create_timer(fire_rate), "timeout")
	can_fire =true 
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
