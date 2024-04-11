extends Node3D

@onready var camera = $"../SubViewport/cameraman/Camera3D2"
func click() -> void:
	$AnimationPlayer.play("click")
	camera.rotation.y = 0
func _on_interactable_interacted(interactor):
	click()



