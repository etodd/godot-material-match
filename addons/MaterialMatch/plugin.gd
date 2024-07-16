@tool
extends EditorPlugin

var import_plugin := preload("material_match.gd").new()

func _enter_tree() -> void:
	add_scene_post_import_plugin(import_plugin)
	_add_custom_project_setting("material_match/material_directories", PackedStringArray(), TYPE_PACKED_STRING_ARRAY)


func _exit_tree() -> void:
	remove_scene_post_import_plugin(import_plugin)

func _add_custom_project_setting(name: String, default_value: Variant, type: int, hint: int = PROPERTY_HINT_NONE, hint_string: String = "") -> void:
	if ProjectSettings.has_setting(name):
		return

	var setting_info: Dictionary = {
		"name": name,
		"type": type,
		"hint": hint,
		"hint_string": hint_string
	}

	ProjectSettings.set_setting(name, default_value)
	ProjectSettings.add_property_info(setting_info)
	ProjectSettings.set_initial_value(name, default_value)
