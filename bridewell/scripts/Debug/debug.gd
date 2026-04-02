extends Node

var DebugMode := false
signal DebugSig

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("DebugToggle"):
		ToggleDebugMode()
	if event.is_action_pressed("Debug1"):
		DebugEvent1()
	if event.is_action_pressed("Debug2"):
		DebugEvent2()
	if event.is_action_pressed("Debug3"):
		DebugEvent3()


func ToggleDebugMode():
	SignalBus.PlayUI.emit("Blip")
	if !DebugMode:
		DebugMode = true
		print("Debug mode set to ", DebugMode)
	else: 
		DebugMode = false
		print("Debug mode set to ", DebugMode)

func DebugEvent1():
	if DebugMode:
		print("DebugEvent 1")
		DebugSig.emit(1)

func DebugEvent2():
	if DebugMode:
		print("DebugEvent 2")
		DebugSig.emit(2)

func DebugEvent3():
	if DebugMode:
		print("DebugEvent 3")
		SignalBus.SendMessage.emit("[GlobalColor name=journal]JOURNAL[/GlobalColor] HAS BEEN UPDATED.")
