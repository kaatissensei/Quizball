extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	populate_questions() # Replace with function body.

func populate_questions():
	var questionArray = Main.questionArray
	var questionScene = load("res://Question.tscn")
	var qNum = 0
	for question in questionArray:
		var questionBlock = questionScene.instantiate()
		#var questionScript = questionBlock.get_script()
		questionBlock.populate_text(question[0], question)#, question[1], question[2], question[3])
		%QuestionGrid.add_child(questionBlock)
		qNum += 1
	if qNum > 10:
		%QuestionGrid.columns = 4
	else:
		%QuestionGrid.columns = 5
		
func _show_answer():
	%PopupQuestion.visible = false
	%PopupAnswer.visible = true
	
func _hide_question():
	%QuestionPopup.visible = false
	%PopupQuestion.visible = true
	%PopupAnswer.visible = false

#Wood tile by bkh1914
