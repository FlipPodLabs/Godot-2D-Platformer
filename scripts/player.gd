
extends CharacterBody2D

## Movement parameters
@export var max_speed := 600.0
@export var acceleration := 1600.0
@export var air_acceleration := 800.0
@export var friction := 2400.0
@export var jump_velocity := -1200.0
@export var gravity := 3000.0
@export var jump_buffer_time := 0.1
@export var coyote_time := 0.1

# State variables
var last_floor_time := 0.0
var jump_pressed_time := 0.0
var facing_right := true

@onready var sprite := $Sprite2D
@onready var animation := $AnimationPlayer

func _physics_process(delta):
    apply_gravity(delta)
    handle_jump()
    handle_movement(delta)
    update_animations()
    
    move_and_slide()  # Must be called last

func apply_gravity(delta):
    if not is_on_floor():
        velocity.y += gravity * delta
        last_floor_time += delta
    else:
        last_floor_time = 0.0

func handle_jump():
    if Input.is_action_just_pressed("jump"):
        jump_pressed_time = 0.0
    else:
        jump_pressed_time += get_physics_process_delta_time()
    
    var can_coyote_jump = last_floor_time < coyote_time
    var has_jump_buffer = jump_pressed_time < jump_buffer_time
    
    if has_jump_buffer and can_coyote_jump:
        velocity.y = jump_velocity
        jump_pressed_time = coyote_time  # Consume jump

func handle_movement(delta):
    var direction = Input.get_axis("move_left", "move_right")
    
    if direction != 0:
        facing_right = direction > 0
        sprite.flip_h = !facing_right
        var accel = acceleration if is_on_floor() else air_acceleration
        velocity.x = move_toward(velocity.x, direction * max_speed, accel * delta)
    elif is_on_floor():
        velocity.x = move_toward(velocity.x, 0.0, friction * delta)

func update_animations():
    if not is_on_floor():
        animation.play("jump")
    elif abs(velocity.x) > 10.0:
        animation.play("run")
    else:
        animation.play("idle")

# Advanced mechanics
var max_fall_speed := 1600.0
var wall_slide_speed := 400.0
var wall_jump_force := Vector2(800.0, -1000.0)

func handle_wall_interactions():
    if is_on_wall() and not is_on_floor():
        velocity.y = min(velocity.y, wall_slide_speed)
        
        if Input.is_action_just_pressed("jump"):
            var wall_normal = get_wall_normal()
            velocity = wall_jump_force * Vector2(-wall_normal.x, 1.0)

func _integrate_forces(state):
    velocity.y = min(velocity.y, max_fall_speed)
