extends Node3D

var lerp_speed = 10.0
var current_position_x = 0
var current_position_z = 0
var direction = Vector3.ZERO
var current_speed = 5.0
var clickcam = false
@onready var camera = $"../SubViewport/cameraman/Camera3D2"

func click():
	$AnimationPlayer.play("click")
	clickcam = true
	await get_tree().create_timer(0.5).timeout
	clickcam = false
func _on_interactable_interacted(interactor):
	click()
	
func _process(delta):
	if clickcam == true:
		current_position_x = camera.position.x
		current_position_z = camera.position.z
		if camera.rotation.x == 90:
			camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		#current_rotation = camera.rotation.y
		#camera.rotation.y = lerp(current_rotation, current_rotation + 25, delta * lerp_speed)
	else:
		current_position_x = current_position_x



