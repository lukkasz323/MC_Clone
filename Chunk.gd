extends Node3D


const packed_block = preload("res://block.tscn")
const size = 16
const height = 8

func _ready():
	for y in height:
		for x in size:
			for z in size:
				var block = packed_block.instantiate()
				block.position.x += x
				block.position.z += z
				block.position.y += -y
				add_child(block)
