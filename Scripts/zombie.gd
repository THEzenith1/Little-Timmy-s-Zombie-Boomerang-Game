extends CharacterBody2D
@onready var ZomHealth = 100
@onready var kb = 1
@onready var zomhurt = 0
func _physics_process(delta):
	velocity = global_position.direction_to(get_node("/root/MainGame/Player").position) * 180 * kb
	move_and_slide()
	if $AnimationPlayer.current_animation != "hurt" and $AnimationPlayer.current_animation != "die": 
		%AnimationPlayer.play("walk_right")
func _zombie_collision(area):
	if area.get_parent() == get_node("/root/MainGame/Player"):
		get_node("/root/MainGame/Player").zom_deal_damage(area,global_position)
	if area == get_node("/root/MainGame/Boomerang_2") and Global.throw == 1:
		kb = -2
		$KbTimer.start()
	if  area == get_node("/root/MainGame/Boomerang_2") and Global.throw > 0:
		ZomHealth -= 40
		%AnimationPlayer.play("hurt")
		if ZomHealth < 1:
			Global.TotalZombies -= 1
			%AnimationPlayer.play("die")
func _on_kb_timer_timeout():
	kb = 1
func _on_animation_player_animation_finished(anim_name: StringName):
	if anim_name == "die":
		queue_free()
