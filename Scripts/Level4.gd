extends Node2D


func _ready():
	pass
	
func nextLevel():
	get_tree().change_scene("res://Cenas/Scene5.tscn")


func _on_Area2D_body_entered(body):
	nextLevel()
