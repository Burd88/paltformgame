extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ItemList_item_rmb_selected(index:int, atpos:Vector2) -> void:
	
	if ($ItemList.isDraggingItem):
		return
	if ($ItemList.isAwaitingSplit):
		return

	$ItemList.dropItemSlot = index
	var itemData:Dictionary = $ItemList.get_item_metadata(index)
	if (int(itemData["id"])) < 1: return
	var strItemInfo:String = ""

	#$WindowDialog_ItemMenu.set_position(get_viewport().get_mouse_position())
	$WindowDialog_ItemMenu.set_title(tr(str(itemData["name"])))
	$WindowDialog_ItemMenu/ItemMenu_TextureFrame_Icon.set_texture($ItemList.get_item_icon(index))

	strItemInfo = tr("NAME_ITEM") +": [color=#00aedb] " + tr(str(itemData["name"])) + "[/color]\n"
	strItemInfo = strItemInfo + "\n [color=#b3cde0]" + tr(str(itemData["description"])) + "[/color]"

	$WindowDialog_ItemMenu/ItemMenu_RichTextLabel_ItemInfo.set_bbcode(strItemInfo)
	if itemData["quest"] == true:
		$WindowDialog_ItemMenu/ItemMenu_Button_DropItem.hide()
	elif itemData["quest"] == false:
		$WindowDialog_ItemMenu/ItemMenu_Button_DropItem.show()
		$WindowDialog_ItemMenu/ItemMenu_Button_DropItem.set_text("(" + String(itemData["amount"]) + ") " +tr("DROP_BUTTON"))
	$ItemList.activeItemSlot = index
	$WindowDialog_ItemMenu.popup()

func _on_ItemMenu_Button_DropItem_pressed():
	var newAmount = Global_Player.inventory_removeItem($ItemList.dropItemSlot)

	if (newAmount < 1):
		$WindowDialog_ItemMenu.hide()
	else:
		$WindowDialog_ItemMenu/ItemMenu_Button_DropItem.set_text("(" + String(newAmount) + ") " +tr("DROP_BUTTON"))
	$ItemList.update_slot($ItemList.dropItemSlot)


	pass # Replace with function body.


	pass # Replace with function body.
