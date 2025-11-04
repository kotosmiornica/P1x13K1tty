extends Control

@onready var hello_label = $HelloLabel

func _ready():
	_update_text()

func _on_lang_button_pressed() -> void:
	var current = TranslationServer.get_locale()
	if current == "en":
		TranslationServer.set_locale("ja")
	else:
		TranslationServer.set_locale("en")
	_update_text()


func _update_text():
	hello_label.text = tr("HELLO")
