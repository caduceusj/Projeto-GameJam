extends Node2D


func _ready():
	$AnimationPlayer.play("text")
	yield($AnimationPlayer, "animation_finished")
	var camera = get_node("res://Cenas/Player.tscn/Camera2D")
	pass
	
func nextLevel():
	get_tree().change_scene("res://Cenas/Scene1.tscn")


func _on_Area2D_body_entered(_body):
	if _body.is_in_group("player"):
		nextLevel()
	else:
		pass





func _on_ArcoFlecha_body_entered(body):
	if body.is_in_group("player"):
		$Arco.hide()
