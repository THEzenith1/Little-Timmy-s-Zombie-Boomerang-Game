extends Area2D
@onready var spawnhealth = 100
func _on_timer_timeout():
	if Global.TotalZombies < 10:
		var Zomb = preload("res://Scenes/zombie.tscn").instantiate()
		Zomb.global_position = global_position
		get_node("/root/MainGame").add_sibling(Zomb)
		Global.TotalZombies += 1
func _on_area_entered(area):
	if  area == get_node("/root/MainGame/Boomerang_2") and Global.throw > 0:
		spawnhealth -= 10
		%TextureProgressBar.value = spawnhealth
		if spawnhealth < 1:
			Global.TotalSpawners -= 1
			queue_free()
