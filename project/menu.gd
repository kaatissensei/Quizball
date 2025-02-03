extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _open_fileDialog():
	%FileDialog.popup()
	
func _on_file_dialog_file_selected(path: String) -> void:
	Main.csvFile = FileAccess.open(path,FileAccess.READ)
	Main.parse_csv()
	get_tree().change_scene_to_file("res://Quiz_scene.tscn")

	#var csvTxt = Main.csvFile.get_as_text()
	#print (csvTxt)


func _on_button_2_pressed() -> void:
	Main.parse_csv()


func _start() -> void:
	get_tree().change_scene_to_file("res://Quiz_scene.tscn")
