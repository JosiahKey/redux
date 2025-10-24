extends Node2D

@onready var tilemap = $map
const ROWS = 9
const COLS = 35
const WALL = Vector2i(2,2)
const PATH = Vector2i(2,1)
var maze = []

var generate_button: Button

func _ready() -> void:
	generate_maze()
	setup_ui()

func setup_ui():
	generate_button = Button.new()
	generate_button.text = "Randomize Maze"
	generate_button.position = Vector2(5, ROWS * 16 +5)
	generate_button.size = Vector2(75, 15)
	generate_button.connect("pressed", Callable(self, "on_genbtn_pressed"))
	add_child(generate_button)

func on_genbtn_pressed():
	generate_maze()

func reset_maze():
	maze = []
	for r in range(ROWS):
		var row = []
		for c in range(COLS):
			row.append(1)
		maze.append(row)


func generate_maze():
	reset_maze()
	
	var start_row = 1
	var start_col = 1
	maze[start_row][start_col] = 0
	
	carve_passage(start_row, start_col)
	print(maze)
	draw_maze()

func carve_passage(row, col):
	var directions = [
		[-2,0], #Up
		[0,2], #Right
		[2,0], #Down
		[0, -2] #Left
	]
	directions.shuffle()
	
	for dir in directions:
		var dr = dir[0]
		var dc = dir[1]
		
		var new_row = row + dr
		var new_col = col + dc
		
		if(
			new_row > 0 and 
			new_row < ROWS - 1 and 
			new_col > 0 and 
			new_col < COLS - 1 and 
			maze[new_row][new_col] == 1
		):
			maze[new_row][new_col] = 0
			maze[row + dr / 2][col + dc / 2] = 0
			carve_passage(new_row, new_col)

func draw_maze():
	tilemap.clear()
	
	for r in range(ROWS):
		for c in range(COLS):
			var tile_type = WALL if maze[r][c] == 1 else PATH
			tilemap.set_cell(Vector2i(c ,r), 0, tile_type)


func _on_button_pressed() -> void:
	generate_maze()
