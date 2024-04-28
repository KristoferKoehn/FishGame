@tool
extends Node3D

@export var current_material : StandardMaterial3D = null;
var hat : MeshInstance3D 


func _ready():
	hat = get_node("Mage_Hat")

func _process(delta):
	if hat.get_surface_override_material(0) != null && !hat.get_surface_override_material(0) == current_material:
		hat.set_surface_override_material(0, current_material)
	
