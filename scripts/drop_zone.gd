extends Panel

# Kunci jawaban urutan obrolan kamu (Sesuaikan dengan emoji_id di tombol)
# Misal: Soal 1 = A, Soal 2 = B, Soal 3 = C, dst.
var correct_answers = ["A", "B", "C", "D", "E"]
var current_level = 0 

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	# Beri tahu Godot kalau kotak ini siap menerima objek apa pun yang di-drop
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	# Data yang dikirim dari tombol sekarang berupa Dictionary: {"id": emoji_id, "node": self}
	var clicked_id = data["id"]
	var drag_button = data["node"]
	
	print("Mencoba drop ID: ", clicked_id, " | Jawaban benar saat ini: ", correct_answers[current_level])
	
	# Cek apakah ID tombol cocok dengan kunci jawaban level saat ini
	if clicked_id == correct_answers[current_level]:
		print("JAWABAN BENAR!")
		
		# 1. Hilangkan tombol yang benar karena sudah terpakai
		drag_button.visible = false 
		
		# 2. Naikkan level obrolan
		current_level += 1
		
		# 3. Cek apakah game sudah tamat (5 emoji habis)
		if current_level >= correct_answers.size():
			print("Semua obrolan selesai! Game Tamat.")
			# get_tree().change_scene_to_file("res://scenes/tamat.tscn")
		else:
			print("Lanjut ke obrolan ke-", current_level + 1)
			# 💡 DI SINI: Tempat kamu mengganti texture/emoji soal NPC berikutnya!
			# Contoh: $../ChatBubble1/TextureRect.texture = load("res://emoji_soal_2.png")
			
	else:
		print("JAWABAN SALAH! Tombol kembali pulang.")
		# Jika salah, langsung perintahkan tombol tadi untuk bergetar dan balik posisinya
		if drag_button.has_method("return_to_base"):
			drag_button.return_to_base()
