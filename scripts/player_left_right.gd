extends CharacterBody2D
class_name Player

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	# Mengambil input sumbu horizontal saja (Kiri = -1, Kanan = 1, Diam = 0)
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		velocity.x = direction * speed
	else:
		# Efek ngerem halus saat tombol dilepas
		velocity.x = move_toward(velocity.x, 0, speed)

	# Pastikan posisi vertikal (Y) terkunci tidak naik-turun
	velocity.y = 0

	move_and_slide()
