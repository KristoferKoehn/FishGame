extends Node
class_name QuestionSettings

var AdditionSingleDigit: bool = false
var AdditionDoubleDigit: bool = false
var SubtractionSingleDigit: bool = false
var SubtractionDoubleDigit: bool = false
var MultiplicationSingleDigit: bool = false
var MultiplicationDoubleDigit: bool = false
var DivisionSingleDigit: bool = false
var DivisionDoubleDigit: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func CheckIsValid() -> bool:
	var isValid = false
	if AdditionSingleDigit:
		isValid = true
	if AdditionDoubleDigit:
		isValid = true
	if SubtractionSingleDigit:
		isValid = true
	if SubtractionDoubleDigit:
		isValid = true
	if MultiplicationSingleDigit:
		isValid = true
	if MultiplicationDoubleDigit:
		isValid = true
	if DivisionSingleDigit:
		isValid = true
	if DivisionDoubleDigit:
		isValid = true
	return isValid

func ConvertToString() -> String:
	var settingsCode: String = ""
	settingsCode = ConvertBoolAndAppend(settingsCode, AdditionSingleDigit)
	settingsCode = ConvertBoolAndAppend(settingsCode, AdditionDoubleDigit)
	settingsCode = ConvertBoolAndAppend(settingsCode, SubtractionSingleDigit)
	settingsCode = ConvertBoolAndAppend(settingsCode, SubtractionDoubleDigit)
	settingsCode = ConvertBoolAndAppend(settingsCode, MultiplicationSingleDigit)
	settingsCode = ConvertBoolAndAppend(settingsCode, MultiplicationDoubleDigit)
	settingsCode = ConvertBoolAndAppend(settingsCode, DivisionSingleDigit)
	settingsCode = ConvertBoolAndAppend(settingsCode, DivisionDoubleDigit)
	return settingsCode

func ConvertBoolAndAppend(settingsCode: String, booleanValue: bool) -> String:
	if booleanValue:
		settingsCode = settingsCode + "1"
	else:
		settingsCode = settingsCode + "0"
	return settingsCode

func updateFromSettingsCode(settingsCode: String) -> void:
	AdditionSingleDigit = ConvertCharToBool(settingsCode[0])
	AdditionDoubleDigit = ConvertCharToBool(settingsCode[1])
	SubtractionSingleDigit = ConvertCharToBool(settingsCode[2])
	SubtractionDoubleDigit = ConvertCharToBool(settingsCode[3])
	MultiplicationSingleDigit = ConvertCharToBool(settingsCode[4])
	MultiplicationDoubleDigit = ConvertCharToBool(settingsCode[5])
	DivisionSingleDigit = ConvertCharToBool(settingsCode[6])
	DivisionDoubleDigit = ConvertCharToBool(settingsCode[7])

func ConvertCharToBool(code: String) -> bool:
	if code == "1":
		return true
	else:
		return false
