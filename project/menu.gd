extends Node2D

@onready var upload_button: Button = %"Upload Button" as Button
@onready var progress: ProgressBar = %"Progress Bar" as ProgressBar
@onready var success_label: Label = %"Success Label" as Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	upload_button.pressed.connect(_on_upload_pressed)
	file_access_web.load_started.connect(_on_file_load_started)
	file_access_web.loaded.connect(_on_file_loaded)
	file_access_web.progress.connect(_on_progress)
	file_access_web.error.connect(_on_error)


func _open_fileDialog():
	%FileDialog.popup()
	
func _on_file_dialog_file_selected(path: String) -> void:
	Main.csvFile = FileAccess.open(path,FileAccess.READ)
	Main.parse_csv()
	get_tree().change_scene_to_file("res://Quiz_scene.tscn")

#WEB FILE ACCESS FUNCTIONS ------------------------------------------------\

var file_access_web: FileAccessWeb = FileAccessWeb.new()

func _on_file_load_started(file_name: String) -> void:
	progress.visible = true
	success_label.visible = false

func _on_upload_pressed() -> void:
	file_access_web.open(".csv")

func _on_progress(current_bytes: int, total_bytes: int) -> void:
	pass
	#var percentage: float = float(current_bytes) / float(total_bytes) * 100
	#progress.value = percentage

func _on_file_loaded(file_name: String, type: String, base64_data: String) -> void:

	var utf8_data: String = Marshalls.base64_to_utf8(base64_data)
	#var string_data: String = base64_data.get_string_from_utf8()
	var file = FileAccess.open("user://Quizball.csv", FileAccess.WRITE)
	if FileAccess.file_exists("user://Quizball.csv"):
		file.store_string(utf8_data)
		file.close() #!!!!!!!!!!!
		Main.csvFile = FileAccess.open("user://Quizball.csv", FileAccess.READ)
		
		Main.parse_csv()
		get_tree().change_scene_to_file("res://Quiz_scene.tscn")
	else:
		pass#%DebugText.text = "Can't find file."
	
	#%DebugText.text = utf8_data
	
	#WIP WHY MUST IT BE 5 Qs????

func _on_error() -> void:
	push_error("Error!")
#--------------------------------------------------------------------/

func _on_button_2_pressed() -> void:
	Main.parse_csv()


func _start() -> void:
	get_tree().change_scene_to_file("res://Quiz_scene.tscn")


func _show_HowToCSV() -> void:
	%HowToCSV.visible = true


func _hide_HowToCSV() -> void:
	%HowToCSV.visible = false
	
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("Fullscreen"):
		#var mode := DisplayServer.window_get_mode()
		#var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)

func _fullscreen():
	var mode := DisplayServer.window_get_mode()
	var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)
