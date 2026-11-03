extends Button

var original_position: Vector2
var parent_container: Node # Menyimpan container wadah saat ini

func _ready():
	await get_tree().process_frame
	original_position = global_position
	parent_container = get_parent()

func _get_drag_data(at_position: Vector2) -> Variant:
	# Kirim data makanan dan referensi tombolnya
	var data = {
		"node": self,
		"nama_makanan": name
	}
	
	# Bikin preview visual makanan saat ditarik
	var preview = TextureRect.new() 
	preview.texture = icon
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.custom_minimum_size = size
	set_drag_preview(preview)
	
	return data

# Fungsi jika makanan salah tempat atau batal di-drop
func return_to_base():
	var tween = create_tween()
	tween.tween_property(self, "global_position", original_position + Vector2(5, 0), 0.05)
	tween.tween_property(self, "global_position", original_position - Vector2(5, 0), 0.05)
	tween.tween_property(self, "global_position", original_position, 0.1)

# Fungsi penting: Jika makanan berhasil pindah kotak, perbarui posisi awalnya
func update_new_position():
	await get_tree().process_frame
	original_position = global_position
	parent_container = get_parent()
