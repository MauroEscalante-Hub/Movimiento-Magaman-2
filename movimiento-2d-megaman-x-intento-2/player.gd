extends CharacterBody2D

var Velocidad: int = 100

var Gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")
#gravedad para los saltos

func _ready() -> void:
	
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	var input_axis = Input.get_axis("Izquierda","Derecha") 
	velocity.x = input_axis * Velocidad
	move_and_slide()
	
	if Input.is_action_just_pressed("Saltar") and is_on_floor():
		velocity.y = -Velocidad * 5
		
	velocity.y += Gravedad * delta
	
	
	pass
