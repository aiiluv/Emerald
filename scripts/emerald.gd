extends StaticBody2D

var player_near = false

@onready var label = $InteractLabel

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/game_2.tscn")

func _on_body_entered(body):
	if body.name == "Player Top-down":
		player_near = true
		label.visible = true

func _on_body_exited(body):
	if body.name == "Player Top-down":
		player_near = false
		label.visible = false
