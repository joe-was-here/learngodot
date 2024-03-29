extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var shoot_right: bool = true

var health: int = 30
var invulnerable: bool = false

signal laser(pos, direction)

func hit():
  if invulnerable:
    return
  health -= 10
  invulnerable = true
  $Timers/InvulnerabilityTimer.start()
  $Sprite2D.material.set_shader_parameter("progress", 1.0)
  if health <= 0:
    queue_free()

func _process(_delta: float) -> void:
  if player_nearby:
    look_at(Globals.player_pos)
    if can_laser:
      
      var marker_node = $LaserSpawnPositions.get_child(shoot_right)
      var pos: Vector2 = marker_node.global_position
      shoot_right = not shoot_right
      
      var direction: Vector2 = (Globals.player_pos - position).normalized()
      laser.emit(pos, direction)
      can_laser = false
      $Timers/LaserCooldown.start()

func _on_attack_area_body_entered(_body: Node2D) -> void:
  player_nearby = true

func _on_attack_area_body_exited(_body: Node2D) -> void:
  player_nearby = false

func _on_laser_cooldown_timeout() -> void:
  can_laser = true

func _on_invulnerability_timer_timeout() -> void:
  invulnerable = false
  $Sprite2D.material.set_shader_parameter("progress", 0.0)
