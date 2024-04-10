extends Node3D

var door_open
# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play("openliftdoor")
	
	
	await get_tree().create_timer(14).timeout
	$AnimationPlayer.play("closedoorlift")
	
	
	
	
	
func _process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

