extends Area2D
func _on_area_entered(area):
	get_node("/root/MainGame/Player/YouWinPixelFont").show()
	self.hide()
