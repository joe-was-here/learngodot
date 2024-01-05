extends Area2D

@export var speed: int = 1000
var direction: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
  if "hit" in body:
    body.hit()
  if body.name != "Player":
    queue_free()


func _on_laser_expiration_timer_timeout() -> void:
  queue_free()
