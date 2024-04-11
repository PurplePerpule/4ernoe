extends Node3D


func click() -> void:
	$AnimationPlayer.play("click")

func _on_interactable_interacted(interactor):
	click()
