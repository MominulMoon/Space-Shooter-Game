extends Node2D
var meteor_scene : PackedScene =load("res://Scene/meteor.tscn")
func _ready():
	$Timer.start()

func _on_timer_timeout() -> void:
	var meteor =meteor_scene.instantiate()
	add_child(meteor)
