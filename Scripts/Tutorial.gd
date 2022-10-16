extends Node2D


func _ready():
	pass
	
func nextLevel():
	get_tree().change_scene("res://Cenas/Scene1.tscn")


func _on_Area2D_body_entered(_body):
	if _body.is_in_group("player"):
		nextLevel()
	else:
		pass
