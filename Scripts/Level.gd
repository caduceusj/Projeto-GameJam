extends CanvasLayer


func _ready():
	pass
	
func nextLevel():
	get_tree().change_scene("res://Cenas/Scene2.tscn")
