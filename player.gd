extends KinematicBody2D

var speed = 400
var jump = -650
var gravity = 20
var UP = Vector2(0, -1)
var motion = Vector2()
var jump_count = 0
var extra_jumps = 1


func _physics_process(delta: float) -> void:
	motion.y += gravity                  #---gravity.
	
	if Input.is_action_pressed("right"): #---when the right arrow key is pressed, 
		motion.x = speed                 #   move to the right.    
							 
	elif Input.is_action_pressed("left"):#---when the left arrow key is pressed, 
		motion.x = -speed                #   move to the left.
	else:
		motion.x = 0                     #---if key is not pressed--> don't move.
		
		
	#---jump and double jump.
	if Input.is_action_just_pressed("jump") && jump_count < extra_jumps:
		motion.y = jump                  #---do jump.
		jump_count += 1                  #---count the jumps.

	#---if player is on floor again--> reset the jump_count back to zero.
	if is_on_floor():
		jump_count = 0
		
	motion = move_and_slide(motion, UP)
	
