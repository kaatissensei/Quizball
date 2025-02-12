extends Button

var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	get_child(0).get_child(1).text = str(score)
