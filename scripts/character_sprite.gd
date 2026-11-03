extends Node2D

@onready var sprite = $Sprite2D

func change_character(speaker_name: String):
	# Dapatkan nilai enum (int) dari string nama pembicara
	var char_enum = Character.get_enum_from_string(speaker_name)
	
	# Cek apakah enum valid (bukan -1) dan terdaftar di dalam character_details
	if char_enum != -1 and Character.character_details.has(char_enum):
		var details = Character.character_details[char_enum]
		
		# Ambil tekstur sprite_frames dari dictionary di class Character
		if details["sprite_frames"] != null:
			sprite.texture = details["sprite_frames"]
		else:
			sprite.texture = null # Jika null (seperti karakter 'You' / Narator)
	else:
		sprite.texture = null # Jika nama tidak terdaftar
