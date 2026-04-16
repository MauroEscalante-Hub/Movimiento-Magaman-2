extends CharacterBody2D

var Velocidad: int = 100
var Dasheando: bool = false
var Dash: int = 500
var Puede_dashear: bool = true
#Quien diria que se necesitaban tantas variables para poder dashear
var Gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")
#gravedad para los saltos

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	var input_axis = Input.get_axis("Izquierda","Derecha")
	if Dasheando: 
		velocity.x = input_axis * Dash
	else: 
		velocity.x = input_axis * Velocidad
	
	if Input.is_action_just_pressed("Dash") and Puede_dashear:
		Dasheando = true 
		Puede_dashear = false
		$CooldownDash.start()
		$CooldownDashReal.start()
	move_and_slide()
 	
	if Input.is_action_just_pressed("Saltar") and is_on_floor():
		velocity.y = -Velocidad * 5
		
	#Esto lo tire solamente por probar, no pense que fuera funcionar
	if Input.is_action_just_pressed("Saltar") and is_on_wall():
		velocity.y = -Velocidad * 5
	velocity.y += Gravedad * delta
	
	pass

func _on_cooldown_dash_timeout() -> void:
	Dasheando = false
	pass # Replace with function body.
	
func _on_cooldown_dash_real_timeout() -> void:
	Puede_dashear = true
	pass # Replace with function body.
