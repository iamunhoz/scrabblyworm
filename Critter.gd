extends RigidBody2D

export var min_speed = 150
export var max_speed = 250



func _ready():
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	print($AnimatedSprite.animation)
	
	
func _process(delta):
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
