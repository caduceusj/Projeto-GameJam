extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var musicStat = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Fade White")
	#yield($AnimationPlayer, "abimation_finished")
	#$AnimationPlayer.play("Camera")
	#$Menu/Iniciar.grab_focus()

func _on_Iniciar_pressed():
	$Menu.hide()
	$AnimationPlayer.play("CameraLightAndZoom")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://Cenas/Intro.tscn")
	
func _on_MutarDesmutar_pressed():
	if musicStat == true:
		$AudioStreamPlayer.stop()
		musicStat = false
	else:
		musicStat = true
		$AudioStreamPlayer.play()
	
	
func _on_Sair_pressed():
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().quit()
	

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Iniciar_button_up():
	pass # Replace with function body.
