extends GridContainer


func add_item(ID = "0"):
	var item_texture = load("res://pics/minerals/" + ItemData.get_texture(ID))
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
	var first_slot = true
	var first_index = 0
	var no_dup = true
	for i in get_children():
		item_quantity = i.get_quantity()
		if i.filled == false && first_slot == true:
			first_index = i.get_index()
			first_slot = false
		if i.filled == true && item_ID == i.get_ID() :
			index = i.get_index()
			item_data["quantity"] = item_quantity+1
			no_dup = false
			break
		#elif i.filled == false:
			#index = i.get_index()
		
	if no_dup:
		get_child(first_index).set_property(item_data)
	if !no_dup:
		get_child(index).set_property(item_data)
