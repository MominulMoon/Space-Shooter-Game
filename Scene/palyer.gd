extends CharacterBody2D
@export var speed :=500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction=Input.get_vector("left","right","up","down")
	velocity =direction*speed*delta
	move_and_slide()
