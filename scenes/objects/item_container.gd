extends StaticBody2D
class_name ItemContainer

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
  pass
  
func hit():
  print("object")
