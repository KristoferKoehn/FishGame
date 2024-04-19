extends QuestionGenerator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func generateQuestion() -> void:
	questionPrompt = "Divide the following numbers: "
	secondOperand = randi_range(10, 32)
	answer = randi_range(10, 32)
	firstOperand = secondOperand * answer
	questionText = str(firstOperand) + " / " + str(secondOperand) + " = "
