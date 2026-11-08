extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if %ScrollStory : %ScrollStory.visible = false
	if %ScrollCredit : %ScrollCredit.visible = false
	
func _on_btn_story_pressed() -> void:
	if %ScrollStory : %ScrollStory.visible = true
	if %ScrollCredit : %ScrollCredit.visible = false

func _on_btn_credit_pressed() -> void:
	if %ScrollStory : %ScrollStory.visible = false
	if %ScrollCredit : %ScrollCredit.visible = true
