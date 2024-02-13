extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser(position, direction)
signal grenade(position, direction)

@export var max_speed: int = 500
var speed: int = max_speed

func hit():
  Globals.health -= 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
  var direction = Input.get_vector("left", "right", "up", "down")
  velocity = direction * speed
  move_and_slide()
  Globals.player_pos = global_position
  
  look_at(get_global_mouse_position())
  var player_direction = (get_global_mouse_position() - position).normalized()
  if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
    Globals.laser_amount -= 1
    can_laser = false
    $LaserTimer.start()
    
    var laser_markers = $LaserStartPositions.get_children()
    var selected_laser = laser_markers[randi() % laser_markers.size()]
    $LaserParticles.global_position = selected_laser.global_position
    $LaserParticles.emitting = true
    laser.emit(selected_laser.global_position, player_direction)
    
  if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
    Globals.grenade_amount -= 1
    can_grenade = false
    $GrenadeTimer.start()
    
    var grenade_markers = $LaserStartPositions.get_children()
    var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
    
    
    grenade.emit(selected_grenade.global_position, player_direction)

func _on_grenade_timer_timeout() -> void:
  can_grenade = true

func _on_laser_timer_timeout() -> void:
  can_laser = true
