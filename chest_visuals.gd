@tool
extends Node3D

@export var mat : StandardMaterial3D 

var e_mat : StandardMaterial3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	e_mat = StandardMaterial3D.new()
	e_mat.albedo_color = Color.ALICE_BLUE
	if mat != null:
		$chest.set_surface_override_material(0, mat)
		$chest/chest_lid.set_surface_override_material(0, mat)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mat != null:
		$chest.set_surface_override_material(0, mat)
		$chest/chest_lid.set_surface_override_material(0, mat)
