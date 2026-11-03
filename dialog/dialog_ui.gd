extends Control

@onready var dialog_line = %DialogLine
@onready var speaker_name = %SpeakerName
@onready var text_blip_sound =  %TextBlipSound

const chara_speed : int = 30
var animate_text : bool = false
var current_visible_characters : int = 0
var current_character_details : Dictionary

func _process(delta):
	if animate_text:
		if dialog_line.visible_ratio < 1:
			dialog_line.visible_ratio += (1.0 / max(1, dialog_line.text.length())) * (chara_speed * delta)
			
			if dialog_line.visible_characters > current_visible_characters:
				current_visible_characters = dialog_line.visible_characters
				
				if text_blip_sound and text_blip_sound.has_method("play_sound"):
					var char_gender = current_character_details.get("gender", -1) 
					text_blip_sound.play_sound(char_gender)
		else:
			# Begitu teks selesai (visible_ratio >= 1)
			animate_text = false
			if text_blip_sound: 
				text_blip_sound.stop() # <--- Tambah pengaman ini agar audio langsung mati total
				

func change_line(speaker_string: String, line: String):
	var char_enum = Character.get_enum_from_string(speaker_string)
	
	if char_enum != -1 and Character.character_details.has(char_enum):
		# Ambil detail karakter spesifik berdasarkan enum (Isinya: name, gender, sprite_frames)
		current_character_details = Character.character_details[char_enum]
		speaker_name.text = current_character_details["name"]
	else:
		# Jika narator / tidak terdaftar, kosongkan detail agar tidak salah bunyikan blip gender lain
		current_character_details = {} 
		speaker_name.text = speaker_string
		
	current_visible_characters = 0
	dialog_line.text = line
	dialog_line.visible_characters = 0
	dialog_line.visible_ratio = 0 # Set ke 0 dulu agar animasi mulai dari awal
	animate_text = true

func skip_text_animation():
	dialog_line.visible_ratio = 1
	animate_text = false
