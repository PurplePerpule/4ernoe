extends Node3D

func click() -> void:
	$AnimationPlayer.play("click")
	$SpotLight3D.visible = true
	await get_tree().create_timer(0.5).timeout
	$SpotLight3D.visible = false
	
	
func _on_interactable_interacted(interactor):
	click()
