extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate() -> void:
	pass # Replace with function body.


func _on_player_grenade(position, direction) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = position
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)


func _on_player_laser(position, direction) -> void:
	var laser = laser_scene.instantiate() as Area2D
	laser.position = position
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	
