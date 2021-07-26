extends Node

export (PackedScene) var Critter
var score


func _ready():
	randomize()
	new_game()


func game_over():
	$ScoreTimer.stop()
	$CritterTimer.stop()

func new_game():
	score = 0
	$Player.start($PlayerStartPosition.position)
	$StartTimer.start()

func _on_StartTimer_timeout():
	$CritterTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 10


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
