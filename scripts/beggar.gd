extends CharacterBody2D

var player_near = false

# Variabel ini akan muncul di Inspector sebelah kanan!
@export var nama_npc: String = "Beggar"
@export var texture_npc: Texture2D # Untuk ganti gambar sprite-nya
@export var nama_timeline_dialogic: String = "timeline_default" # ID Timeline Dialogic

@onready var label = $InteractLabelNPC

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/game_2.tscn")

func _on_body_entered(body):
	print("Ada objek masuk: ", body.name)
	
	# KODE BARU: Jika yang masuk adalah dirinya sendiri, abaikan!
	if body == self:
		return
		
	# Baru setelah itu cek apakah itu player
	if body is Player: # atau pakai body.name == "Player left-right"
		player_near = true
		label.visible = true

func _on_body_exited(body):
	if body == self:
		return
		
	if body is Player: # atau pakai body.name == "Player left-right"
		player_near = false
		label.visible = false
