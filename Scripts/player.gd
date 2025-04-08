extends CharacterBody2D

var velocitat:= 500
var direccio := Vector2.ZERO
var gravetat = Vector2.DOWN * 988
var salt := -500
var max_salt := 2
var salts_disponibles := max_salt
var vides:= 3

var monedes_agafades = 0

func moneda_agafada():
	monedes_agafades += 1
	$contador_monedes.text = "%d" % [monedes_agafades]


func _ready() -> void:
	MOTION_MODE_GROUNDED
	position = Vector2(0,530)

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
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		
	#animacions
	if dx == 0:
		$AnimatedSprite2D.play("quiet")
	else:
		if is_on_floor():
			$AnimatedSprite2D.play("correr")
		else:
			$AnimatedSprite2D.play("salt")
	
	if vides == 0:
		self.queue_free()
	if vides == 2:
		$Cor2.play("Buit")
	if vides == 1:
		$Cor3.play("Buit")
	
	
		
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self:
		vides-=1
		position = Vector2(0,530)
		
	
	
	
