extends Node3D


const packed_block = preload("res://block.tscn")
const size = 16
const depth = 4

func _ready():
	var noisemap = generate_noisemap(size)
	print(noisemap)
	
	for x in size:
		for z in size:
			var hill_size = noisemap[x][z]
			for y in 4 + hill_size:
				generate_block(x, z, y)


func generate_block(x, z, y):
	var block = packed_block.instantiate()
	block.position.x += x
	block.position.z += z
	block.position.y += y
	add_child(block)


func generate_hills():
	var noisemap = generate_noisemap(size)
	print(noisemap)
	for y in size:
		pass


func generate_noisemap(size):
	var noisemap = []
	
	var rng = RandomNumberGenerator.new()
	for _x in size:
		var row = []
		for _z in size:
			row.append(rng.randi_range(0, 2))
		noisemap.append(row)
	
	return noisemap
