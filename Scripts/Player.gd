
extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet = preload("res://Cenas/Bullet.tscn") 
export var bullet_speed = 1000
export var fire_rate = 0.75
var movespeed = 250
var direction = 1

onready var PlayerAnim = $PlayerAnim

var health = 3
var can_fire = true
# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerAnim.play("Idle")
	pass # Replace with function body


func _physics_process(_delta):
	move()
	
	if Input.is_action_just_pressed("LMB") and can_fire:
		fire()

func move():
	var motion = Vector2()

	if Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down"):
		motion.y -= 1
		if direction == 2:
			PlayerAnim.play("WalkRight")
			PlayerAnim.flip_h = true
		elif direction == 1:
			PlayerAnim.play("WalkRight")
			PlayerAnim.flip_h = false
	if Input.is_action_pressed("ui_down") and !Input.is_action_pressed("ui_up"):
		motion.y += 1
		if direction == 2:
			PlayerAnim.play("WalkRight")
			PlayerAnim.flip_h = true
		elif direction == 1:
			PlayerAnim.play("WalkRight")
			PlayerAnim.flip_h = false
	if Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
		motion.x -= 1
		direction = 2
		PlayerAnim.play("WalkRight")
		PlayerAnim.flip_h = true
	if Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
		motion.x += 1
		direction = 1
		PlayerAnim.play("WalkRight")
		PlayerAnim.flip_h = false
	elif motion.x == 0 and motion.y == 0:
		PlayerAnim.play("Idle")
		
	look_at(get_global_mouse_position())
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = position
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().add_child(bullet_instance)

	can_fire = false
	yield(get_tree().create_timer(fire_rate), "timeout")
	can_fire =true 
	



func _on_BulletArea_body_entered(_body):
	if _body.is_in_group("bullet"):
		_body.queue_free()
		get_tree().reload_current_scene()
	elif _body.is_in_group("Enemy"):
		get_tree().reload_current_scene()
		

