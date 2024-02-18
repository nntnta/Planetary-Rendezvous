extends PanelContainer
class_name Slot

@onready var texture_rect = $slot_texture

@export_enum("NONE:0","ARMOR:1","LENS:2","BOOTS:3","ACTIVE:4") var slot_type: int

var filled : bool = false

func _get_drag_data(_pos):
	set_drag_preview(get_preview())
	return texture_rect
	
func _can_drop_data(_pos, data):
	return data is TextureRect

func _drop_data(_pos, data):
	var temp = texture_rect.property
	texture_rect.property = data.property
	if data.ID == texture_rect.ID:
		set_quantity(texture_rect.quantity)
	data.property = temp
	
	
		

func get_preview():
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture_rect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(40,40)
	
	var preview = Control.new()
	preview.add_child(preview_texture) 
	return preview
	
func get_ATK():
	return texture_rect.ATK

func get_ID():
	return texture_rect.ID
	
func get_quantity():
	return texture_rect.quantity
	
func set_quantity(data):
	texture_rect.quantity += data

func set_property(data):
	texture_rect.property = data
	if data["TEXTURE"] == null:
		filled = false
	else:
		filled = true
