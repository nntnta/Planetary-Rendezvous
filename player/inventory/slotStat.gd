extends TextureRect

@export var slot_type: int = 0
@export var ID = '0'
@export var ATK = 0
@export var quantity: int = 0:
	set(value):
		quantity = value
		if quantity > 1:
			%debug.text = str(quantity)
		
		if get_parent() is PassiveSlot:
			get_parent().get_parent().calculate()
		
@onready var property: Dictionary = {"TEXTURE": texture,
									"ATK": ATK,
									"SLOT_TYPE": slot_type,
									"ID": ID,
									"quantity" : quantity}:
	set(value):
		property = value
		texture = property["TEXTURE"]
		ATK = property["ATK"]
		slot_type = property["SLOT_TYPE"]
		ID = property["ID"]
		quantity = property["quantity"]
