extends Node2D

# Pastikan nama unique node di editor sesuai, ganti %Character jadi %CharaSprite jika kamu mengubah nama nodenya di scene tree
@onready var character = %CharacterSprite
@onready var dialog_ui = %DialogUI

var dialog_index : int = 0

const dialog_lines : Array[String] = [
	"Cop: Hi! I'm Hope, can we be friend?",
	"Emerald: ...",
	"Cop: I'll take that as a yes."
]

func _ready():
	dialog_index = 0
	process_current_line()

func _input(event):
	if event.is_action_pressed("next_line"):
		if dialog_ui.animate_text:
			dialog_ui.skip_text_animation()
		else:
			if dialog_index < len(dialog_lines) - 1:
				dialog_index += 1
				process_current_line()
	
func parse_line(line: String):
	var line_info = line.split(":")
	assert(len(line_info) >= 2)
	return {
		"speaker_name": line_info[0].strip_edges(),
		"dialog_line": line_info[1].strip_edges()
	}

func process_current_line():
	var line = dialog_lines[dialog_index]
	var line_info = parse_line(line)
	
	# Oper data string pembicara dan teksnya ke UI dan Sprite Karakter
	dialog_ui.change_line(line_info["speaker_name"], line_info["dialog_line"])
	character.change_character(line_info["speaker_name"])
