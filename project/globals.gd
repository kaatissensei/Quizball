extends Node

var csvFile
var questionArray = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _open_filedialog():
	%FileDialog.popup()
	
func parse_csv():
	while csvFile.get_position() < csvFile.get_length():
		questionArray.push_back(csvFile.get_csv_line())
		
	questionArray.pop_front() #Take out titles

func parse_csv_string():
	questionArray = csvFile.split(",")
	questionArray.pop_front()
	
func popupQuestion(questionText):
	%QuestionPopup.visible = true
	%QuestionPopupText.text = questionText
	
	
