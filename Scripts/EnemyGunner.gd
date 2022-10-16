extends KinematicBody2D


var speed = 200
var motion = Vector2.ZERO
var player = null
var health = 2
var bullet = preload("res://Cenas/EnemyBullet.tscn") 
var bullet_speed = 500
var can_fire = true
var fire_rate = 2.0

func _physics_process(_delta):
	motion = Vector2.ZERO
	fire()
	if player:
		motion = position.direction_to(player.position) * speed
		look_at(player.get_global_position())
	motion = move_and_slide(motion)
	


func fire():
	if can_fire == true and player != null:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire =true

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player = body
		
	else:
		pass


func _on_BulletArea_body_entered(_body):
	if _body.is_in_group("bullet"):
		health = health - 1
		if (health == 0):
				queue_free()
		_body.queue_free()
	else:
		pass # Replace with function body.

