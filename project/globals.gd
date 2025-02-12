extends Node

var csvFile
var questionArray = []
var debug
var pointsToAdd
var correctTeam

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	debug = ""
	pointsToAdd = 0
	
func _open_filedialog():
	%FileDialog.popup()
	
func parse_csv():
	#while not csvFile.eof_reached():
	while csvFile.get_position() < csvFile.get_length():
		var csvLine = csvFile.get_csv_line()
		questionArray.push_back(csvLine)
	questionArray.pop_front()

func parse_csv_string():
	questionArray = csvFile.split(",")
	questionArray.pop_front()
	
func popupQuestion(questionText):
	%QuestionPopup.visible = true
	%QuestionPopupText.text = questionText
	
func fullscreen():
	var mode := DisplayServer.window_get_mode()
	var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)
	
