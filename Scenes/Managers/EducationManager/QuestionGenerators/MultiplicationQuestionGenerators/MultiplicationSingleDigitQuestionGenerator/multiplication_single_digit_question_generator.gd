extends QuestionGenerator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func generateQuestion() -> void:
	questionType = "multiplicationSingle"
	questionPrompt = "Multiply the following numbers: "
	firstOperand = getSingleDigitNumber()
	secondOperand = getSingleDigitNumber()
	answer = firstOperand * secondOperand
	questionText = str(firstOperand) + " X " + str(secondOperand) + " = "
