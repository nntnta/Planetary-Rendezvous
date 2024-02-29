extends Node2D

var first = false
var second = false
var third = false
var fourth = false
var fifth = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play('start')



func _input(event):
	if (event.is_action_pressed('rightClick') or event.is_action_pressed('leftClick')  or event.is_action_pressed('spaceBar')) && !first && !$AnimationPlayer.is_playing():
		first = true
		$AnimationPlayer.queue('first')
	
	if (event.is_action_pressed('rightClick') or event.is_action_pressed('leftClick')  or event.is_action_pressed('spaceBar')) && first && !second && !$AnimationPlayer.is_playing():
		second = true
		$AnimationPlayer.queue('second')
	
	if (event.is_action_pressed('rightClick') or event.is_action_pressed('leftClick')  or event.is_action_pressed('spaceBar')) && first && second && !third && !$AnimationPlayer.is_playing():
		third = true
		$AnimationPlayer.queue('third')
		
	if (event.is_action_pressed('rightClick') or event.is_action_pressed('leftClick')  or event.is_action_pressed('spaceBar')) && first && second && third && !fourth && !$AnimationPlayer.is_playing():
		fourth = true
		$AnimationPlayer.queue('fourth')
		#go_to_menu()
	
	if (event.is_action_pressed('rightClick') or event.is_action_pressed('leftClick')  or event.is_action_pressed('spaceBar')) && first && second && third && fourth && !fifth && !$AnimationPlayer.is_playing():
		fifth = true
		go_to_menu()

func go_to_menu():
	Transition.exit_rocket()
