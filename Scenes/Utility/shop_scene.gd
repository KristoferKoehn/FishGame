@tool
extends Node3D

func _ready(): 
    var mat : StandardMaterial3D = StandardMaterial3D.new()
    mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
    mat.albedo_texture = $SubViewport.get_texture()
    $ShopVisual/Screen.set_surface_override_material(0, mat)
    pass


func _process(_delta):
    pass
