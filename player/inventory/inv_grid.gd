extends GridContainer

func _ready():
	for i in global.item_array:
		add_item(i)

func add_item(ID = "0"):
	if global.item_array == null:
		global.item_array.append(ID)
	elif !global.item_array.has(ID):
		global.item_array.append(ID)
	
	var item_texture = load("res://pics/inventory_stuff/" + ItemData.get_texture(ID))
	var item_slot_type = ItemData.get_slot_type(ID)
	var item_ATK = ItemData.get_ATK(ID)
	var item_ID = ID
	var item_quantity = 1
	var item_data = {"TEXTURE": item_texture,
					"ATK": item_ATK,
					"SLOT_TYPE": item_slot_type,
					"ID": item_ID,
					"quantity": item_quantity}
					
	var index = 0
	for i in get_children():
		item_quantity = i.get_quantity()
	
		if i.filled == false :
			index = i.get_index()
			break
		#elif i.filled == false:
			#index = i.get_index()
	
	get_child(index).set_property(item_data)
	
