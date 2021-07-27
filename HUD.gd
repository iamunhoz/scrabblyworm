extends CanvasLayer

# this signal tells Main that StartButton has been pressed.
signal start_game

func show_message(message):
	$Message.text = message
	$Message.show()
	$MessageTimer.start()

# This function is called when the player loses.
# It will show "Game Over" for 2 seconds,
# then return to the title screen and, after a brief pause,
# show the "Start" button.
func show_game_over():
  show_message("Game Over")
  yield($MessageTimer, "timeout")

  $Message.text = "Dodge the \nCreeps!"
  $Message.show()
  yield(get_tree().create_timer(1), "timeout")
  $StartButton.show()

func update_score(score):
  $ScoreLabel.text = str(score)

func _ready():
	pass

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_StartButton_pressed():
  $StartButton.hide()
  emit_signal("start_game")
