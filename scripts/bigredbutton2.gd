extends Node3D

func click() -> void:
	$AnimationPlayer.play("click")
	$submarine/bigredbutton/SpotLight3D.visible = true
	await get_tree().create_timer(0.5).timeout
	$submarine/bigredbutton/SpotLight3D.visible = false
	
	
func _on_interactable_interacted(interactor):
	click()
