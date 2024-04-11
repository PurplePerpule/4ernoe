extends Node3D
var lerp_speed = 0.05
var current_rotation = 90.0
var right_rotation = 45.0
var clickcam = false
@onready var camera = $"../SubViewport/cameraman/Camera3D2"

func click():
	$AnimationPlayer.play("click")
	clickcam = true
	await get_tree().create_timer(0.335).timeout
	clickcam = false
func _on_interactable_interacted(interactor):
	click()
	
func _process(delta):
	if clickcam == true:
		current_rotation = camera.rotation.y
		camera.rotation.y = lerp(current_rotation, current_rotation + 30, delta * lerp_speed)
	else:
		current_rotation = current_rotation
		print(round(rad_to_deg(camera.rotation.y)))
