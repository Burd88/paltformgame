extends Node

onready var file = File.new()

func load_data(url) -> Dictionary:
	if url == null: 
		#print("нету файла") 
		return {}
	if !file.file_exists(url): 
		#print("пустой файл") 
		return {}
	file.open(url, File.READ)
	var data:Dictionary = {}
	data = parse_json(file.get_as_text())
	file.close()
	return data

func write_data(url:String, dict:Dictionary):
	#print("save data inventory")
	if url == null: return
	file.open(url, File.WRITE)
	file.store_line(to_json(dict))
	file.close()
