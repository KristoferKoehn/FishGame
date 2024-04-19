extends QuestionGenerator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func generateQuestion() -> void:
	questionPrompt = "Add the following numbers: "
	firstOperand = getDoubleDigitNumber()
	secondOperand = getDoubleDigitNumber()
	answer = firstOperand + secondOperand
	questionText = str(firstOperand) + " + " + str(secondOperand) + " = "
