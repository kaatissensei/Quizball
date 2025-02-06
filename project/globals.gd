extends Node

var csvFile
var questionArray = []
var debug

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	debug = ""
	
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
	
	
