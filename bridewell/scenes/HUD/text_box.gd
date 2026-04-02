extends MarginContainer

@onready var TextLog: RichTextLabel = $MarginContainer/RichTextLabel

func _ready() -> void:
	SignalBus.SendMessage.connect(AddMessage)
	var effect = GlobalTextColor.new()
	TextLog.install_effect(effect)

func AddMessage(text: String):
	TextLog.append_text("\n-" + text)
	SignalBus.PlayUI.emit("Message")
	await get_tree().create_timer(0.1).timeout
	var lines = TextLog.get_line_count()
	if lines > 10:
		CullLines()

func CullLines():
	var first_break = TextLog.text.find("\n")
	if first_break != -1:
		TextLog.text = TextLog.text.substr(first_break + 1)
