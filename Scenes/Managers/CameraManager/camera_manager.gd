extends Node

var Camera : MainCamera = null
var default_follow : Node3D

func assign_follow_point(node : Node3D):
    Camera.alternate_follow = node

func default_view() -> void:
    Camera.alternate_follow = default_follow
