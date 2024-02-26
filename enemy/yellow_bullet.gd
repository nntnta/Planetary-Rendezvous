extends CharacterBody2D
var direction
var stop = false
@export var deflected_dmg = 3
@export var speed = 25000
#var angle
# Called when the node enters the scene tree for the first time.
func _ready():
	#$deflected/coll_deflect.disabled = true
	$deflected.monitoring = false
	$deflected.monitorable = false
	direction = $"../player".global_position - $".".global_position 
	$".".rotation = direction.angle()
	#angle = $".".transform.x.angle_to(direction )


func _physics_process(delta):
	if !stop:
		velocity = direction.normalized() * speed * delta
		move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_hurtbox_area_entered(area):
	if area.is_in_group('player'):
		#global.hp -= 1
		$AnimationPlayer.play('collided')
		#queue_free()
	
	if area.is_in_group('melee_weapon'):
		direction = area.global_position.direction_to(self.global_position)
		speed = 50000
		$deflected.monitoring = true
		$deflected.monitorable = true
		$hurtbox/coll.disabled = true
		#$deflected/coll_deflect.disabled = false

func brake():
	stop = true


func _on_deflected_area_entered(area):
	if area.is_in_group('enemy'):
		area.get_parent().get_parent().find_child('sprite').self_modulate = Color(100,100,100)
		area.get_parent().get_parent().find_child('hitbox').find_child('attacked2').start()
		$AnimationPlayer.play('collided')
		area.get_parent().get_parent().hp -= deflected_dmg


