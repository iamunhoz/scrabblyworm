extends CanvasLayer

signal start_game

func show_message(message):
	$Message.text = message
	$Message.show()
	$MessageTimer.start()

func _ready():
	pass
