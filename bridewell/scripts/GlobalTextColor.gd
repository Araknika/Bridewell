@tool
class_name GlobalTextColor
extends RichTextEffect


var bbcode := "GlobalColor"


func _process_custom_fx(char_fx: CharFXTransform):
	var color_name = char_fx.env.get("name", "default")
	
	if Utility.ThemeColors.has(color_name):
		char_fx.color = Utility.ThemeColors[color_name]
	return true
