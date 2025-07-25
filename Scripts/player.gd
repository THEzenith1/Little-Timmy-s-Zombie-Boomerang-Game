extends CharacterBody2D
@onready var PlayerHealth = 100
var knockback_vector = Vector2(0,0)
func _physics_process(delta):
	if $AnimationPlayer.current_animation != "hurt" and PlayerHealth > 1:
		velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * 500
		move_and_slide()
		if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down"):
			$AnimationPlayer.play("walk_right")
		else:
			$AnimationPlayer.play("idle_right")
		%TextureProgressBar.value = PlayerHealth
		get_node("/root/MainGame/Target").global_position = get_global_mouse_position()
	elif PlayerHealth > 1:
		global_position += lerp(global_position,knockback_vector,1)
	if PlayerHealth < 1:
		%GameOverFont.show()
		$PointLight2D.energy -= 0.01 
func zom_deal_damage(arg1,arg2):
	PlayerHealth -= 2
	$AnimationPlayer.play("hurt")
	knockback_vector = (global_position - arg2).normalized() * 7
func _on_damage_timer_timeout():
	PlayerHealth -= 0.3333333333333333333333333333333333333
