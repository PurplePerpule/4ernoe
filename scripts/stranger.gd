extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("idle")
	
func dialog():
	pass


func _on_interactable_interacted(interactor):
	
	
	await get_tree().create_timer(3).timeout
	$"../submarine/lukeforsubmarine/AnimationPlayer".play("openorclose")
	$"../submarine/lukeforsubmarine/skeletforluke/Skeleton3D/Cube_009/StaticBody3D/CollisionShape3D".disabled = true
