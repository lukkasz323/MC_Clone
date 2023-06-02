extends Node3D


func _ready():
	for y in 16:
		for x in 8:
			for z in 8:
				var block = $Block.duplicate()
				block.position.x += x
				block.position.z += z
				block.position.y += -y
				add_child(block)
