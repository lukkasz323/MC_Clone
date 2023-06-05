extends Node3D


const packed_chunk = preload("res://chunk.tscn")
const size = 2


func _ready():
	var timer = get_tree().create_timer(0)
	for x in size:
		for z in size:
			var chunk = packed_chunk.instantiate()
			chunk.position.x += x * chunk.size
			chunk.position.z += z * chunk.size
			add_child(chunk)
