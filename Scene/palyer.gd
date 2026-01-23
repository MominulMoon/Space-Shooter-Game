extends CharacterBody2D
@onready var laser_cooldown = $LaserCooldown
var can_shoot = true
@export var speed :=500

signal laser(pos)

func _ready() -> void:
	position=Vector2(1280/2,680)  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction=Input.get_vector("left","right","up","down")
	velocity =direction*speed
	move_and_slide()
	
	
	
	#shoot input
	if Input.is_action_just_pressed("Shoot") and can_shoot:
		laser.emit($LaserStartingPosition.global_position)
		can_shoot=false
		laser_cooldown.start()


func _on_laser_cooldown_timeout() -> void:
		can_shoot=true
