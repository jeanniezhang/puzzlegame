extends CharacterBody2D

var pushing = false

func push(direction):
	if pushing:
		return
	if test_move(transform, direction * 64):
		return
		
	pushing = true
	var tween = get_tree().create_tween()
	tween.tween_property(
		self,
		"position",
		position + direction * 64,
		0.5
	)
	tween.connect("finished", _on_tween_finished)
	
func _on_tween_finished():
	pushing = false
