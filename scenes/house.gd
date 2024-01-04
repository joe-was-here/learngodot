extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass

signal player_entered

signal player_exited

func _on_body_entered(_body: Node2D) -> void:
  player_entered.emit()


func _on_body_exited(_body: Node2D) -> void:
  player_exited.emit()
