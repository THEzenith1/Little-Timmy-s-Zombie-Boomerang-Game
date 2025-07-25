extends Area2D
func _on_area_entered(area):
	if Global.TotalSpawners > 0 and area.get_parent() == get_node("/root/MainGame/Player"):
		get_node("/root/MainGame/Player").global_position = Vector2(-2854,1966)
