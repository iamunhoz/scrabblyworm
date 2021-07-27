extends Node

export (PackedScene) var Critter
var score


func _ready():
	randomize()
	$HUD/StartButton.hide()
	new_game()


func game_over():
	$ScoreTimer.stop()
	$CritterTimer.stop()
	$HUD.show_game_over()
	get_tree().call_group("mob", "queue_free")
	$Music.stop()
	$Music/DeathSound.play()

func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($PlayerStartPosition.position)
	$StartTimer.start()
	$Music.play()

func _on_StartTimer_timeout():
	$CritterTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 10
	$HUD.update_score(score)


func _on_CritterTimer_timeout():
	$CritterPath/SpawnLocation.offset = randi()
	
	var critter = Critter.instance()
	add_child(critter)
	
	var direction = $CritterPath/SpawnLocation.rotation + PI/2
	critter.position = $CritterPath/SpawnLocation.position
	
	direction += rand_range(-PI/4, PI/4)
	critter.rotation = direction
	
	critter.linear_velocity = Vector2(rand_range(critter.min_speed, critter.max_speed), 0)
	critter.linear_velocity = critter.linear_velocity.rotated(direction)
