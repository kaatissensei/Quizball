extends Control

var questionNum
var questionArr # [Category, Q1, A1, Q2, A2...

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func populate_text(category, question):#, q1, q2, q3):
	%CategoryText.text = category
	questionArr = question
	#%Q1Btn.text = q1
	#%Q2Btn.text = q2
	#%Q3Btn.text = q3

func _display_question(qNum):
	print(questionArr[0])
	var questionText
	var answerText
	match qNum:
		1:
			%Q1Btn.text = questionArr[1] #set btn text = question
			%Q1Btn.disabled = true
			questionText = questionArr[1]
			answerText = questionArr[2]
		2:
			%Q2Btn.text = questionArr[3]
			%Q2Btn.disabled = true
			questionText = questionArr[3]
			answerText = questionArr[4]
		3:
			%Q3Btn.text = questionArr[5]
			%Q3Btn.disabled = true
			questionText = questionArr[5]
			answerText = questionArr[6]
		_:
			questionText = ""
	var QuestionPopupNode = get_node("/root/Node2D/CanvasLayer/QuestionPopup")
	#Main.popupQuestion(questionText)
	QuestionPopupNode.visible = true
	QuestionPopupNode.get_child(0).text = questionText
	QuestionPopupNode.get_child(1).text = answerText
