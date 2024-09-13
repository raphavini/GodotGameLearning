extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

var move_direction : int = 0

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite_player : Sprite2D = $Sprite2D
@onready var timer_andar : Timer = $TimerAndar
@onready var timer_parar : Timer = $TimerParar

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_wall():
		parar()

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		parar()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")+move_direction
	
	if direction:
		#print("ANDANDO")
		velocity.x = direction * SPEED
		sprite_player.flip_h=direction<0
		animation_player.current_animation="walk"
	else:
		#print("PARADO")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation_player.current_animation="idle"
		
	move_and_slide()

func andar() -> void:
	print("ANDAR")
	timer_andar.stop()
	
	var randomico = randi() % 15
	print("Randomico: ", randomico)
	timer_parar.wait_time=timer_andar.wait_time
	timer_andar.wait_time=randomico
	timer_parar.start()
	
	var par_ou_impar = randomico % 2
	if par_ou_impar == 0:
		move_direction = 1
		print("DIREITA")
	else:
		move_direction = -1
		print("ESQUERDA")
	print(move_direction)
	
func parar() -> void:
	print("PARAR")
	sprite_player.flip_h=not sprite_player.flip_h
	move_direction=0
	timer_parar.stop()
	timer_andar.start()
