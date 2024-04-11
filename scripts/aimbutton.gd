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
		if round(rad_to_deg(camera.rotation.y)) == 0 or round(rad_to_deg(camera.rotation.y)) == -0 :
			#camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 30 or round(rad_to_deg(camera.rotation.y)) == 31:
			camera.position.x = lerp(current_position_x, current_position_x - 2, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 3, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 60 or round(rad_to_deg(camera.rotation.y)) == 61:
			camera.position.x = lerp(current_position_x, current_position_x - 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 90 or round(rad_to_deg(camera.rotation.y)) == 91:
			camera.position.x = lerp(current_position_x, current_position_x - 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 120 or round(rad_to_deg(camera.rotation.y)) == 121:
			camera.position.x = lerp(current_position_x, current_position_x - 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 150 or round(rad_to_deg(camera.rotation.y)) == 151:
			camera.position.x = lerp(current_position_x, current_position_x - 2, delta * lerp_speed)	
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 180 or round(rad_to_deg(camera.rotation.y)) == 181:
			#camera.position.x = lerp(current_position_x, current_position_x - 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 210 or round(rad_to_deg(camera.rotation.y)) == 211:
			camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 3, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 240 or round(rad_to_deg(camera.rotation.y)) == 241:
			camera.position.x = lerp(current_position_x, current_position_x + 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 270 or round(rad_to_deg(camera.rotation.y)) == 271:
			camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
			#camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 300 or round(rad_to_deg(camera.rotation.y)) == 301:
			camera.position.x = lerp(current_position_x, current_position_x + 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == 330 or round(rad_to_deg(camera.rotation.y)) == 331:
			camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 3, delta * lerp_speed)
			#camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		#current_rotation = camera.rotation.y
		#if camera.rotation.y == -0:
			#camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
			#camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		if round(rad_to_deg(camera.rotation.y)) == -30:
			camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 3, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -60:
			camera.position.x = lerp(current_position_x, current_position_x + 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -90:
			camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -120 or round(rad_to_deg(camera.rotation.y)) == -121:
			camera.position.x = lerp(current_position_x, current_position_x + 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -150 or round(rad_to_deg(camera.rotation.y)) == -151 :
			camera.position.x = lerp(current_position_x, current_position_x + 2, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 3, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -180 or round(rad_to_deg(camera.rotation.y)) == -181:
			#camera.position.x = lerp(current_position_x, current_position_x - 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -210 or round(rad_to_deg(camera.rotation.y)) == -211:
			camera.position.x = lerp(current_position_x, current_position_x - 2, delta * lerp_speed)	
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -240 or round(rad_to_deg(camera.rotation.y)) == -241:
			camera.position.x = lerp(current_position_x, current_position_x - 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z + 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -270 or round(rad_to_deg(camera.rotation.y)) == -271:
			camera.position.x = lerp(current_position_x, current_position_x - 2, delta * lerp_speed)
			#camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -300 or round(rad_to_deg(camera.rotation.y)) == -301:
			camera.position.x = lerp(current_position_x, current_position_x - 3, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 2, delta * lerp_speed)
		elif round(rad_to_deg(camera.rotation.y)) == -330 or round(rad_to_deg(camera.rotation.y)) == -331:
			camera.position.x = lerp(current_position_x, current_position_x - 2, delta * lerp_speed)
			camera.position.z = lerp(current_position_z, current_position_z - 3, delta * lerp_speed)
		#current_rotation = camera.rotation.y
		print("  x",current_position_x,"  z",current_position_z,"  y", camera.rotation.y)#camera.rotation.y = lerp(current_rotation, current_rotation + 25, delta * lerp_speed)
	else:
		if round(rad_to_deg(camera.rotation.y)) == -360 or round(rad_to_deg(camera.rotation.y)) == -361 or round(rad_to_deg(camera.rotation.y)) == 360 or round(rad_to_deg(camera.rotation.y)) == 361:
			camera.rotation.y = 0
			
		current_position_x = current_position_x -1
		current_position_z = current_position_z -1
