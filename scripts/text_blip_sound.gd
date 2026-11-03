extends AudioStreamPlayer

const sounds : Dictionary = {
	0: preload("res://assets/sounds/textBlipFml.ogg"), # 0 untuk female
	1: preload("res://assets/sounds/txtBlipMale.ogg")   # 1 untuk male
}

func play_sound(gender_int: int):
	if sounds.has(gender_int):
		stream = sounds[gender_int]
		stop() # <--- PAKSA BERHENTI SUARA SEBELUMNYA DI SINI
		play() # Putar ulang dari awal (milidetik ke-0)
