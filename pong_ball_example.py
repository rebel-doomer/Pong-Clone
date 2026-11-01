from godot import CharacterBody2D # this is purely to be used as a sort of pseudo-code exercise draft, none of this code actually is meant to make sense to anyone outside of myself

SPEED = 400
vector_velocity = Vector2.ZERO
is_moving = false
#setup vector variable. a vector usually holds a direction (normalized to a length of 1) 

# todo Add a ball that moves around the playfield and bounces off of the paddles and walls.

def _physics_process(x, y):
    if not is_moving:
        if Input.is_pressed("moveUp" or "moveDown"):
            ball_start()
        else:
            return

move_and_slide()

def ball_start():
    is_moving = True
    pass