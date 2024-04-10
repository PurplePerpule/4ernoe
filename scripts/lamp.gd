extends Node3D
var light = false


func light_lamp():
	if light == false:
		$Cube_003/OmniLight3D.visible = true
		light = true
	elif light == true:
		$Cube_003/OmniLight3D.visible = false
		light = false
	
	
	
func _on_interactable_interacted(interactor):
	light_lamp()
