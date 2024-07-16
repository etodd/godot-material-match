@tool
extends EditorScenePostImportPlugin

func _pre_process(scene: Node) -> void:
	iterate(scene)

func iterate(node: Node) -> void:
	for child in node.get_children():
		iterate(child)
	
	if not node is ImporterMeshInstance3D:
		return

	var mesh: ImporterMesh = node.mesh
	
	var material_directories: PackedStringArray = ProjectSettings.get_setting("material_match/material_directories", PackedStringArray())

	for index in mesh.get_surface_count():
		var material_name: String = mesh.get_surface_material(index).resource_name

		for dir in material_directories:
			var path: String = '%s/%s.tres' % [dir, material_name]
			if not ResourceLoader.exists(path, "Material"):
				continue
			var material: Material = ResourceLoader.load(path, "Material")
			mesh.set_surface_material(index, material)
