extends CharacterBody2D

var speed = 150

func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity = Vector2.RIGHT
		$AnimatedSprite2D.play("right")
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2.LEFT
		$AnimatedSprite2D.play("left")
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP
		$AnimatedSprite2D.play("up")
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.DOWN
		$AnimatedSprite2D.play("down")
	if Input.is_action_just_released("ui_up") or \
		Input.is_action_just_released("ui_down") or \
		Input.is_action_just_released("ui_left") or \
		Input.is_action_just_released("ui_right"):
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 0

	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var node = collision.get_collider()
		if node is CharacterBody2D:
			node.push(velocity)
