extends Node

signal task_updated

# Status progress per ruangan
var sapu_done = {
	"kamar_tidur" : false,
	"dapur" : false,
	"teras" : false,
	"halaman" : false,
}

var pel_done = {
	"kamar_tidur" : false,
	"dapur" : false,
	"teras" : false,
	"halaman" : false,
}

var bawa_ember_pel: bool = false
var cuci_piring_done: bool = false

func is_all_sapu_done() -> bool:
	for room in sapu_done.values():
		if not room:
			return false
	return true
	
func is_all_pel_done() -> bool:
	for room in pel_done.values():
		if not room:
			return false
	return true
	
func kerjakan_ruangan(room_id: String):
	if not sapu_done[room_id]:
		sapu_done[room_id] = true
		emit_signal("task_updated")
	elif is_all_sapu_done() and bawa_ember_pel and not pel_done[room_id]:
		pel_done[room_id] = true
		emit_signal("task_updated")
		
func ambil_pel():
	if is_all_pel_done():
		bawa_ember_pel = true
		emit_signal("task_updated")

func selesaikan_cuci_piring():
	cuci_piring_done = true
	emit_signal("task_updated")
		
