extends QuestionGenerator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func generateQuestion() -> void:
	questionType = "subtractionDouble"
	questionPrompt = "Subtract the following numbers: "
	firstOperand = getDoubleDigitNumber()
	secondOperand = getDoubleDigitNumber()
	if secondOperand > firstOperand:
		var temp = firstOperand
		firstOperand = secondOperand
		secondOperand = temp
		
	answer = firstOperand - secondOperand
	questionText = str(firstOperand) + " - " + str(secondOperand) + " = "
