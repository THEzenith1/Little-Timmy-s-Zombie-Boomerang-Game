extends Area2D
@onready var throwpos = Vector2(10,10)
@onready var throwfrom = Vector2(10,10)
func _physics_process(delta):
	if Global.throw == 0:
		global_position = get_node("/root/MainGame/Player/BoomerangPoint").global_position
		if Input.is_action_pressed("boom_throw"):
			throwpos = round(get_global_mouse_position())
			throwfrom = round(global_position)
			Global.throw = 1
	if Global.throw == 1:
		rotation_degrees += 15
		global_position = lerp(global_position,throwpos, delta * 4)
		if abs(lerp(global_position,throwpos, delta * 4)-throwpos).y < 20 and abs(lerp(global_position,throwpos, delta * 2)-throwpos).x < 20:
			Global.throw = 2
	if Global.throw == 2:
		if abs( lerp(global_position,get_node("/root/MainGame/Player/BoomerangPoint").global_position, delta * 2)-get_node("/root/MainGame/Player/BoomerangPoint").global_position).y < 30 and abs( lerp(global_position,get_node("/root/MainGame/Player/BoomerangPoint").global_position, delta * 2)-get_node("/root/MainGame/Player/BoomerangPoint").global_position).x < 30:
			Global.throw = 0
			rotation_degrees = 0
		rotation_degrees += 15
		global_position = lerp(global_position,throwfrom, delta * 2)
