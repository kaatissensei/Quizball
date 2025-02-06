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
	if csvFile.get_length() < 1:
		debug = debug + "No csvFile data. "
	else:
		debug = debug + "len=%d" % csvFile.get_length()
	while csvFile.get_position() < csvFile.get_length():
		var csvLine = csvFile.get_csv_line()
		questionArray.push_back(csvLine)
		
	if questionArray.is_empty():
		debug = debug + "empty questionArray"
	else:
		pass#debug = debug + questionArray.pop_front() #Take out titles

func parse_csv_string():
	questionArray = csvFile.split(",")
	questionArray.pop_front()
	
func popupQuestion(questionText):
	%QuestionPopup.visible = true
	%QuestionPopupText.text = questionText
	
	
