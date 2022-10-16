extends KinematicBody2D


var speed = 200
var motion = Vector2.ZERO
var player = null
var health = 3

func _ready():
	var test = randi()%3+1
	$Sprite.texture = load("res://Imagens/Enemies/sem_arma_"+test+".png")

func _physics_process(_delta):
	motion = Vector2.ZERO
	if player:
		motion = position.direction_to(player.position) * speed
	motion = move_and_slide(motion)


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
