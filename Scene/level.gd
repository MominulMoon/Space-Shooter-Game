extends Node2D
#load scene
var meteor_scene : PackedScene =load("res://Scene/meteor.tscn")
var laser_scene :PackedScene =load("res://Scene/laser.tscn")
func _ready():
	#Lasers
	$Timer.start()
	# Stars
	var size:=get_viewport().get_visible_rect().size
	var rng=RandomNumberGenerator.new()
	for star in $Stars.get_children():
		#position
		var random_x=rng.randi_range(0,int(size.x))
		var random_y=rng.randi_range(0,int(size.y))
		star.position=Vector2(random_x,random_y)
		#Scale
		var random_scale=rng.randi_range(1,2)
		star.scale =Vector2(random_scale,random_scale)
		#Speed
		star.speed_scale =rng.randf_range(0.6,1.4)

func _on_timer_timeout() -> void:
	#create instance
	var meteor =meteor_scene.instantiate()
	#attch the node to the scene tree
	$Meteors.add_child(meteor)


func _on_palyer_laser(pos) -> void:
	#create instance
	var laser=laser_scene.instantiate()
	#attch the node to the scene tree
	$Laser.add_child(laser)
	laser.position=pos
