extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/objects/item.tscn")

func _ready():
  for container in get_tree().get_nodes_in_group("Container"):
    container.connect("open", _on_container_opened)


func _on_container_opened(pos, direction):
  var item = item_scene.instantiate()
  item.position = pos
  item.direction = direction
  $Items.call_deferred('add_child', item)

func _on_player_grenade(position, direction) -> void:
  var grenade = grenade_scene.instantiate() as RigidBody2D
  grenade.position = position
  grenade.linear_velocity = direction * grenade.speed
  $Projectiles.add_child(grenade)
  $UI.update_grenade_text()


func _on_player_laser(position, direction) -> void:
  var laser = laser_scene.instantiate() as Area2D
  laser.position = position
  laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
  laser.direction = direction
  $Projectiles.add_child(laser)
  $UI.update_laser_text()
