extends Panel

var mouse_inside : bool = false
@onready var grid_container = $GridContainer # Tempat menampung tombol makanan

func _ready() -> void:
	mouse_entered.connect(func(): mouse_inside = true)
	mouse_exited.connect(func(): mouse_inside = false)

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		if mouse_inside:
			var drag_data = get_viewport().gui_get_drag_data()
			
			if typeof(drag_data) == TYPE_DICTIONARY and drag_data.has("node"):
				eksekusi_pindah_bekal(drag_data["node"])

func eksekusi_pindah_bekal(tombol_makanan: Button):
	# Cek apakah makanan itu berasal dari kotak lain (bukan kotak ini sendiri)
	if tombol_makanan.get_parent() != grid_container:
		print(tombol_makanan.name, " berhasil dipindahkan ke ", name)
		
		# 1. Cabut makanan dari kotak lamanya
		tombol_makanan.get_parent().remove_child(tombol_makanan)
		
		# 2. Masukkan makanan ke dalam GridContainer kotak bekal yang baru
		grid_container.add_child(tombol_makanan)
		
		# 3. Suruh makanan mencatat posisi barunya agar tidak mental balik
		tombol_makanan.update_new_position()
