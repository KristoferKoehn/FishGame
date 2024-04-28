extends Control

var lines: Node = null
var pressed: bool = false
var linesStack: Array = []
var redoStack: Array = []
var currentLine: Line2D = null
var color: Color = Color.BLUE
var lineWidth: float = 12

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		pressed = event.pressed
		
		if pressed && event.position.x > get_parent().size.x && visible == true:
			redoStack = []
			currentLine = Line2D.new()
			currentLine.default_color = color
			currentLine.width = lineWidth
			linesStack.append(currentLine)
			lines.add_child(currentLine)
	
	if event is InputEventMouseMotion && pressed && event.position.x > get_parent().size.x && currentLine != null:
		currentLine.add_point(event.position - position)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lines = $Lines

func _process(_delta: float) -> void:
	if linesStack.size() < 1:
		$VBoxContainer/HBoxContainer/undo.disabled = true
	else:
		$VBoxContainer/HBoxContainer/undo.disabled = false
		
	if redoStack.size() < 1:
		$VBoxContainer/HBoxContainer/redo.disabled = true
	else:
		$VBoxContainer/HBoxContainer/redo.disabled = false
	

func _on_undo_button_down() -> void:
	currentLine = linesStack.pop_back()
	redoStack.append(currentLine)
	currentLine.visible = false
	currentLine = linesStack.back()


func _on_redo_button_down() -> void:
	currentLine = redoStack.pop_back()
	linesStack.append(currentLine)
	currentLine.visible = true
	#lines.add_child(currentLine)


func _on_red_button_down() -> void:
	color = Color.RED


func _on_green_button_down() -> void:
	color = Color.GREEN


func _on_blue_button_down() -> void:
	color = Color.BLUE


func _on_small_button_down() -> void:
	lineWidth = 6


func _on_medium_button_down() -> void:
	lineWidth = 12


func _on_large_button_down() -> void:
	lineWidth = 24
