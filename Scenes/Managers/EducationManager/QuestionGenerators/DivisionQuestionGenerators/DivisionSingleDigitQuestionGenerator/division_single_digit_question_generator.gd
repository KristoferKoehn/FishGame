extends QuestionGenerator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func generateQuestion() -> void:
	questionPrompt = "Divide the following numbers: "
	secondOperand = randi_range(1,10)
	answer = getSingleDigitNumber()
	firstOperand = secondOperand * answer
	questionText = str(firstOperand) + " / " + str(secondOperand) + " = "
