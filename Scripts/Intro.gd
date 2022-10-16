extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Intro1.1")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://Cenas/Scene0.tscn")
	pass # Replace with function body.


func _input(event):
		if event.is_action_pressed("LMB"):
			$AnimationPlayer.stop()
			get_tree().change_scene("res://Cenas/Scene0.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
