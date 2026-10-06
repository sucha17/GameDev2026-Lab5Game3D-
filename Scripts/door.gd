extends Area3D

@export_file("*.tscn") var next_scene: String = ""

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	print("วัตถุสัมผัสประตู: ", body.name)
	if body.is_in_group("player") or body.name.to_lower().contains("player"):
		if next_scene != "":
			get_tree().change_scene_to_file(next_scene)
		else:
			print("ข้อผิดพลาด: ยังไม่ได้ระบุไฟล์ Next Scene ใน Inspector")
