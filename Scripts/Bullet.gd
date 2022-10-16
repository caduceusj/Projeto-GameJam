extends RigidBody2D

func _ready():
	yield(get_tree().create_timer(0.6), "timeout")
	queue_free()
