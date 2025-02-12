extends Control

var questionNum
var questionArr # [Category, Q1, A1, Q2, A2...

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func populate_text(category, question):#, q1, q2, q3):
	%CategoryText.text = category
	if question:
		questionArr = question
	else:
		pass #questionArr = ["cat", "q1", "a1", "q2", "a2", "q3", "a3"]
	#%Q1Btn.text = q1
	#%Q2Btn.text = q2
	#%Q3Btn.text = q3

func _display_question(qNum):
	var questionText
	var answerText
	match qNum:
		1: #3pts
			%Q1Btn.text = questionArr[1] #set btn text = question
			%Q1Btn.disabled = true
			questionText = questionArr[1]
			answerText = questionArr[2]
			Main.pointsToAdd = 3
		2: #4pts
			%Q2Btn.text = questionArr[3]
			%Q2Btn.disabled = true
			questionText = questionArr[3]
			answerText = questionArr[4]
			Main.pointsToAdd = 4
		3: #5pts
			%Q3Btn.text = questionArr[5]
			%Q3Btn.disabled = true
			questionText = questionArr[5]
			answerText = questionArr[6] 
			Main.pointsToAdd = 5
		_:
			questionText = ""
	var QuestionPopupNode = get_node("/root/Node2D/CanvasLayer/QuestionPopup")
	#Main.popupQuestion(questionText)
	QuestionPopupNode.visible = true
	QuestionPopupNode.get_child(0).visible = true
	QuestionPopupNode.get_child(1).visible = false
	
	QuestionPopupNode.get_child(0).text = questionText
	QuestionPopupNode.get_child(1).text = answerText
