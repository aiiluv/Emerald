class_name Character
extends Node

enum Name {
	You,
	Emerald,
	Cop,
	Emerald_mother
}

# Di dalam class_name Character kamu

const character_details : Dictionary = {
	Name.You: {
		"name" : "Hope",
		"gender" : 0,  # <--- GANTI JADI ANGKA (Misal: 0 = Female, 1 = Male)
		"sprite_frames": null
	},
	Name.Emerald: {
		"name" : "Emerald",
		"gender" : 0,  # <--- GANTI JADI ANGKA
		"sprite_frames": preload("res://assets/sprites/Mask group (4).png")
	},
	Name.Emerald_mother: {
		"name" : "Emerald mother",
		"gender" : 0,  # <--- GANTI JADI ANGKA
		"sprite_frames": preload("res://assets/sprites/Mask group (4).png")
	},
	Name.Cop: {
		"name" : "Cop",
		"gender" : 1,  # <--- GANTI JADI ANGKA
		"sprite_frames": preload("res://assets/sprites/paling gede.png")
	},
}

static func get_enum_from_string(string_value: String) -> int:
	# Ubah string input menjadi UPPERCASE agar cocok dengan penulisan Enum
	# Contoh: "Emerald" -> "EMERALD"
	# Tapi tunggu, di enum kamu menulis "Emerald_mother", jadi kita butuh pencocokan yang pas.
	
	# Ambil semua nama kunci (keys) dari enum Name dalam bentuk Array[String]
	# Isi Name.keys() adalah: ["You", "Emerald", "Cop", "Emerald_mother"]
	var enum_keys = Name.keys()
	
	# Kita cari apakah string_value (misal "Emerald") ada di dalam list keys tersebut
	for key in enum_keys:
		if key.to_lower() == string_value.to_lower():
			return Name[key]
			
	# Jika tidak ditemukan setelah di-looping
	push_error("Invalid Character name: " + string_value) # Perbaikan typo huruf S kecil
	return -1
