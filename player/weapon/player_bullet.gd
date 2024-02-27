extends CharacterBody2D
var direction
var stop = false
@export var dmg = 0.5
@export var speed = 25000
#var angle
# Called when the node enters the scene tree for the first time.
func _ready():
	#$deflected/coll_deflect.disabled = true
	#$deflected.monitoring = false
	#$deflected.monitorable = false
	direction = get_global_mouse_position() - $".".global_position 
	$".".rotation = direction.angle()
	#angle = $".".transform.x.angle_to(direction )


func _physics_process(delta):
	if !stop:
		velocity = direction.normalized() * speed * delta
		move_and_slide()
	
	if !global.banana_shooter_drop:
		$sprite.frame_coords = Vector2(1,2)
		speed = 50000
		dmg = 2

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_hurtbox_area_entered(area):
	if area.is_in_group('enemy'):
		area.get_parent().get_parent().find_child('sprite').self_modulate = Color(100,100,100)
		area.get_parent().get_parent().find_child('hitbox').find_child('attacked').start()
		$AnimationPlayer.play('collided')
		area.get_parent().get_parent().hp -= dmg
	

func brake():
	stop = true


