extends LevelParent

@export var inside_level: PackedScene


func _on_gate_player_entered_gate() -> void:
  var tween = create_tween()
  tween.tween_property($Player, "speed", 0, 0.5)
  get_tree().change_scene_to_packed(inside_scene)

func _on_house_player_entered() -> void:
  var tween = get_tree().create_tween()
  tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)


func _on_house_player_exited() -> void:
  var tween = get_tree().create_tween()
  tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
