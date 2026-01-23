extends Node2D
#load scene
var meteor_scene : PackedScene =load("res://Scene/meteor.tscn")
var laser_scene :PackedScene =load("res://Scene/laser.tscn")
func _ready():
	$Timer.start()

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
