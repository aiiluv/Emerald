extends CharacterBody2D

# Kecepatan jalan karakter
@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	# 1. Ambil input dari panah / WASD
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 2. Jika ada input, jalankan karakter. Jika tidak, ngerem (kecepatan jadi 0)
	if direction != Vector2.ZERO:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)

	# 3. Fungsi bawaan Godot untuk menggerakkan karakter + menangani tabrakan
	move_and_slide()
