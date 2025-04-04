extends CharacterBody2D

var velocitat:= 500
var direccio := Vector2.ZERO
var gravetat = Vector2.DOWN * 988
var salt := -500
var max_salt := 2
var salts_disponibles := max_salt

func _ready() -> void:
	MOTION_MODE_GROUNDED

func _process(delta: float) -> void:
	var dx = Input.get_axis("moure_esquerra","moure_dreta")
	velocity.x=0
	
	velocity.x += dx * velocitat

	if Input.is_action_just_pressed("salt") and salts_disponibles > 0:
		velocity.y += salt
		salts_disponibles -= 1
	
	move_and_slide()
	
	velocity += gravetat * delta
	if is_on_floor():
		salts_disponibles = 2
		
	if velocity.x > 0:
		$player_sprite.flip_h = true
	else:
		$player_sprite.flip_h = false
