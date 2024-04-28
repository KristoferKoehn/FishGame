@tool

extends Node3D

var direction : bool = false;

@export
var text : String = ""


func _ready() -> void:
	var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "position", Vector3(position.x, position.y + 0.1, position.z), 1)
	tween.tween_callback(self.reprocess)

func reprocess() -> void:
	var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "position", Vector3(position.x, position.y + -0.1 if direction else position.y + 0.1, position.z), 1)
	tween.tween_callback(self.reprocess)
	direction = !direction

func _process(_delta: float) -> void:
	$MeshInstance3D.mesh.text = text
