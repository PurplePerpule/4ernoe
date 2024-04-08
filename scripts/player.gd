extends CharacterBody3D

@onready var head = $head
@onready var camera_3d = $head/eyes/Camera3D
@onready var eyes = $head/eyes

var walk = false
var crouch = false

var current_speed = 5.0
const walk_speed = 5.0
const crouch_speed = 2.0

var crouching_depth = -0.5
var lerp_speed = 10.0
var direction = Vector3.ZERO
var mouse_sen = 0.3

var head_bobbing_vector = Vector2.ZERO
var head_bobbing_index = 0.0
var head_bobbing_current_itens = 0.0

const head_bobbing_walk_speed = 14.0
const head_bobbing_crouch_speed = 10.0

const head_bobbing_walk_itens = 0.1
const head_bobbing_crouch_itens = 0.05




# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sen))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sen))
		head.rotation.x = clamp(head.rotation.x,deg_to_rad(-89),deg_to_rad(89))
		
		
func _physics_process(delta):
	
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	
	#head bobbing
	
	if walk: 
		head_bobbing_current_itens = head_bobbing_walk_itens
		head_bobbing_index += head_bobbing_walk_speed * delta 
	elif crouch:
		head_bobbing_current_itens = head_bobbing_crouch_itens
		head_bobbing_index += head_bobbing_crouch_speed * delta
	
	if is_on_floor() && input_dir != Vector2.ZERO:
		head_bobbing_vector.y = sin(head_bobbing_index)
		head_bobbing_vector.x = sin(head_bobbing_index/2) + 0.5
		
		eyes.position.y = lerp(eyes.position.y, head_bobbing_vector.y * (head_bobbing_current_itens/2.0), delta * lerp_speed)
		eyes.position.x = lerp(eyes.position.x, head_bobbing_vector.x * head_bobbing_current_itens, delta * lerp_speed)
	else:
		eyes.position.y = lerp(eyes.position.y, 0.0, delta*lerp_speed)
		eyes.position.x = lerp(eyes.position.x, 0.0, delta*lerp_speed)
		
		#gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_pressed("crouch"):
		crouch = true
		walk = false
		current_speed = crouch_speed
		head.position.y = lerp(head.position.y , 1.8 + crouching_depth, delta * lerp_speed)
	else:
		head.position.y = lerp( head.position.y, 1.8, delta * lerp_speed)
		current_speed = walk_speed
		crouch = false
		walk = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = lerp(direction,(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta*lerp_speed)
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()
