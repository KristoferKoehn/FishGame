extends QuestionGenerator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func generateQuestion() -> void:
	questionType = "subtractionSingle"
	questionPrompt = "Subtract the following numbers: "
	firstOperand = getSingleDigitNumber()
	secondOperand = getSingleDigitNumber()
	if secondOperand > firstOperand:
		var temp = firstOperand
		firstOperand = secondOperand
		secondOperand = temp
		
	answer = firstOperand - secondOperand
	questionText = str(firstOperand) + " - " + str(secondOperand) + " = "
