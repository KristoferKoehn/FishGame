extends MeshInstance3D

func _ready() -> void:
    var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR)
    var tween2 = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR)
    tween.tween_property(self, "position", Vector3(randf_range(-3, 3),randf_range(-2, 2), randf_range(-2, 2)), 1)
    tween2.tween_property(self, "rotation", Vector3(randf_range(-2, 2),randf_range(-2, 2), randf_range(-2, 2)), 1)

    tween.tween_callback(self.reprocess)

func reprocess() -> void:
    var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR)
    var tween2 = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR)
    tween.tween_property(self, "position", Vector3(randf_range(-3, 3),randf_range(-2, 2), randf_range(-2, 2)), 1)
    tween2.tween_property(self, "rotation", Vector3(randf_range(-2, 2),randf_range(-2, 2), randf_range(-2, 2)), 1)
    tween.tween_callback(self.reprocess)
