extends CharacterBody3D

var lerp_speed = 10.0
var current_position = 0
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
	
func _physics_process(delta):
	if clickcam == true:
		velocity.x += 2
		if direction:
			velocity.x = direction.x * current_speed
			velocity.z = direction.z * current_speed
		else:
			velocity.x = move_toward(velocity.x, 0, current_speed)
			velocity.z = move_toward(velocity.z, 0, current_speed)
	else:
		current_position = current_position
		
	move_and_slide()
