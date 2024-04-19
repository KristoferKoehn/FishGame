extends Node
class_name QuestionGenerator

var firstOperand = ""
var secondOperand = ""
var answer = ""
var questionPrompt = ""
var questionText =""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func generateQuestion() -> void:
	pass
	
func getSingleDigitNumber() -> int:
	return randi_range(0,10)

func getDoubleDigitNumber() -> int:
	return randi_range(10,100)
