extends KinematicBody2D

const SPEED = 200

# higher is slower
const ACCEL_NORMAL = 3
const ACCEL_PARACHUTE = 10
var ACCEL = ACCEL_NORMAL

const DECEL_NORMAL = 5
const DECEL_PARACHUTE = 10
var DECEL = DECEL_NORMAL

const GRAV_NORMAL = 10
const GRAV_PARACHUTE = 1
const GRAV_NONE = 0
var GRAV = GRAV_NORMAL
const JUMP = -200
const CLIMB = -30

var velocity = Vector2(0, 0)

var parachuting = false
var parachute_just_started = false

var grabbing_moss = 0

var stevens = 0

func addSteven():
	Global.add_steven()
	$AudioStreamPlayer2.play()

func _process(_delta):
	$spr_marlio/parachute.visible = parachuting
	if(parachuting):
		$spr_marlio.rotation_degrees = clamp(velocity.x / 4, -45, 45)
	else:
		$spr_marlio.rotation_degrees = 0

func _physics_process(delta):
	if(Input.is_action_just_pressed("reset")):
		Global.reset()
		
	var left = -int(Input.is_action_pressed("ui_left"))
	var right = int(Input.is_action_pressed("ui_right"))
	var jump = Input.is_action_pressed("ui_accept")
	
	if(parachuting):
		GRAV = GRAV_PARACHUTE
		ACCEL = ACCEL_PARACHUTE
		DECEL = DECEL_PARACHUTE
	elif(grabbing_moss and left + right != 0):
		GRAV = GRAV_NONE
		ACCEL = ACCEL_NORMAL
		DECEL = DECEL_NORMAL
	else:
		GRAV = GRAV_NORMAL
		ACCEL = ACCEL_NORMAL
		DECEL = DECEL_NORMAL
	
	var move = (left + right) * SPEED
	if(move != 0):
		if(int(velocity.x) == 0 or sign(move) != sign(velocity.x) or (is_on_floor() and jump)):
			$CPUParticles2D.emitting = true
			$CPUParticles2D.gravity.x = 98 * -sign(move)
		else:
			$CPUParticles2D.emitting = false
		if(sign(move) == sign(velocity.x)):
			velocity.x += (move - velocity.x) / ACCEL
		else:
			velocity.x += (move - velocity.x) / (ACCEL + 1)
		
	else:
		velocity.x += (move - velocity.x) / DECEL
	
	if(parachuting):
		$spr_marlio.animation = "parachute"
	elif(move == 0):
		$spr_marlio.animation = "idle"
	elif(velocity.y < 0):
		$spr_marlio.animation = "jump"
	else:
		$spr_marlio.animation = "walk"
	
	if(velocity.x < 0):
		$spr_marlio.flip_h = true
	elif(velocity.x > 1):
		$spr_marlio.flip_h = false
	
	velocity.y += GRAV
	if(is_on_floor() or GRAV == GRAV_NONE):
		if(!parachute_just_started):
			if(parachuting == true):
				$parachute_particles.emitting = true
			parachuting = false
		else:
			parachute_just_started = false
		if(velocity.y > 0):
			velocity.y = 0
			
		if(jump):
			if(grabbing_moss):
				velocity.y = CLIMB
			else:
				velocity.y = JUMP
				$AudioStreamPlayer.play()

	move_and_slide(velocity, Vector2(0, -1))
