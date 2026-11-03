extends Button

@export var emoji_id: String = "D"
var original_position: Vector2

func _ready():
	# Gunakan await untuk menunggu Container selesai menyusun posisi tombol di layar saat game dimulai
	await get_tree().process_frame
	original_position = global_position # Ganti ke global_position

func _get_drag_data(at_position: Vector2) -> Variant:
	# Kita kirim paket data lengkap: ID-nya apa, dan Node tombolnya yang mana
	var data = {
		"id": emoji_id if emoji_id != "DragEmoji4" else name,
		"node": self
	}
	
	# Bikin preview visual
	var preview = TextureRect.new()
	preview.texture = icon
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.custom_minimum_size = size
	set_drag_preview(preview)
	
	return data

func return_to_base():
	var tween = create_tween()
	# Gerakkan global_position agar bisa melawan aturan HBoxContainer sementara waktu
	tween.tween_property(self, "global_position", original_position + Vector2(10, 0), 0.05)
	tween.tween_property(self, "global_position", original_position - Vector2(10, 0), 0.05)
	tween.tween_property(self, "global_position", original_position, 0.1)
